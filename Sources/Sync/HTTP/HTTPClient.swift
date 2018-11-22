//
//  HTTPClient.swift
//  RoverSync
//
//  Created by Sean Rucker on 2018-09-11.
//  Copyright © 2018 Rover Labs Inc. All rights reserved.
//

import Foundation
import os.log

public final class HTTPClient {
    public let endpoint: URL
    public let accountToken: String
    public let session: URLSession
    
    public init(accountToken: String, endpoint: URL, session: URLSession) {
        self.accountToken = accountToken
        self.endpoint = endpoint
        self.session = session
    }
}

extension HTTPClient {
    public func downloadRequest(queryItems: [URLQueryItem]) -> URLRequest {
        var urlComponents = URLComponents(url: endpoint, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = queryItems
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("gzip", forHTTPHeaderField: "accept-encoding")
        urlRequest.setAccountToken(accountToken)
        return urlRequest
    }
    
    public func uploadRequest() -> URLRequest {
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("gzip", forHTTPHeaderField: "accept-encoding")
        urlRequest.setValue("gzip", forHTTPHeaderField: "content-encoding")
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.setAccountToken(accountToken)
        return urlRequest
    }
    
    public func bodyData<T>(payload: T) -> Data? where T: Encodable {
        let encoded: Data
        do {
            encoded = try JSONEncoder.default.encode(payload)
        } catch {
            os_log("Failed to encode events: %@", log: .networking, type: .error, error.localizedDescription)
            return nil
        }
        
        let compressed: Data
        do {
            compressed = try encoded.gzipped()
        } catch {
            os_log("Failed to gzip events: %@", log: .networking, type: .error, error.localizedDescription)
            return nil
        }
        
        return compressed
    }
    
    public func downloadTask(with request: URLRequest, completionHandler: @escaping (HTTPResult) -> Void) -> URLSessionDataTask {
        return self.session.dataTask(with: request, completionHandler: { (data, urlResponse, error) in
            let result = HTTPResult(data: data, urlResponse: urlResponse, error: error)
            completionHandler(result)
        })
    }
    
    public func uploadTask(with request: URLRequest, from bodyData: Data?, completionHandler: @escaping (HTTPResult) -> Void) -> URLSessionUploadTask {
        return self.session.uploadTask(with: request, from: bodyData, completionHandler: { (data, urlResponse, error) in
            let result = HTTPResult(data: data, urlResponse: urlResponse, error: error)
            completionHandler(result)
        })
    }
}

// MARK: Experiences

extension HTTPClient: FetchExperienceClient {
    public func task(with experienceIdentifier: ExperienceIdentifier, completionHandler: @escaping (FetchExperienceResult) -> Void) -> URLSessionTask {
        let queryItems = self.queryItems(experienceIdentifier: experienceIdentifier)
        let request = self.downloadRequest(queryItems: queryItems)
        return self.downloadTask(with: request) {
            let result: FetchExperienceResult
            switch $0 {
            case .error(let error, let isRetryable):
                if let error = error {
                    os_log("Failed to fetch experience: %@", log: .networking, type: .error, error.localizedDescription)
                } else {
                    os_log("Failed to fetch experience", log: .networking, type: .error)
                }
                
                result = .error(error: error, isRetryable: isRetryable)
            case .success(let data):
                let response: Response
                do {
                    response = try JSONDecoder.default.decode(Response.self, from: data)
                    result = .success(experience: response.data.experience)
                } catch {
                    os_log("Failed to decode experience: %@", log: .networking, type: .error, error.localizedDescription)
                    result = .error(error: error, isRetryable: false)
                }
            }
            
            completionHandler(result)
        }
    }
}
