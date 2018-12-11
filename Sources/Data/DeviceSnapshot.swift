//
//  DeviceSnapshot.swift
//  RoverData
//
//  Created by Sean Rucker on 2018-05-02.
//  Copyright © 2018 Rover Labs Inc. All rights reserved.
//

import Foundation

class DeviceSnapshot: NSObject, Codable, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.advertisingIdentifier, forKey: "advertisingIdentifier")
        aCoder.encode(self.isBluetoothEnabled, forKey: "isBluetoothEnabled")
        aCoder.encode(self.localeLanguage, forKey: "localeLanguage")
        aCoder.encode(self.localeRegion, forKey: "localeRegion")
        aCoder.encode(self.localeScript, forKey: "localeScript")
        aCoder.encode(self.isLocationServicesEnabled, forKey: "isLocationServicesEnabled")
        aCoder.encode(self.location, forKey: "location")
        aCoder.encode(self.locationAuthorization, forKey: "locationAuthorization")
        aCoder.encode(self.notificationAuthorization, forKey: "notificationAuthorization")
        aCoder.encode(self.pushToken, forKey: "pushToken")
        aCoder.encode(self.isCellularEnabled, forKey: "isCellularEnabled")
        aCoder.encode(self.isWifiEnabled, forKey: "isWifiEnabled")
        aCoder.encode(self.appBadgeNumber, forKey: "appBadgeNumber")
        aCoder.encode(self.appBuild, forKey: "appBuild")
        aCoder.encode(self.appIdentifier, forKey: "appIdentifier")
        aCoder.encode(self.appVersion, forKey: "appVersion")
        aCoder.encode(self.buildEnvironment?.rawValue, forKey: "buildEnvironment")
        aCoder.encode(self.deviceIdentifier, forKey: "deviceIdentifier")
        aCoder.encode(self.deviceManufacturer, forKey: "deviceManufacturer")
        aCoder.encode(self.deviceModel, forKey: "deviceModel")
        aCoder.encode(self.deviceName, forKey: "deviceName")
        aCoder.encode(self.operatingSystemName, forKey: "operatingSystemName")
        aCoder.encode(self.operatingSystemVersion, forKey: "operatingSystemVersion")
        aCoder.encode(self.screenHeight, forKey: "screenHeight")
        aCoder.encode(self.screenWidth, forKey: "screenWidth")
        aCoder.encode(self.sdkVersion, forKey: "sdkVersion")
        aCoder.encode(self.carrierName, forKey: "carrierName")
        aCoder.encode(self.radio, forKey: "radio")
        aCoder.encode(self.isTestDevice, forKey: "isTestDevice")
        aCoder.encode(self.timeZone, forKey: "timeZone")
        aCoder.encode(self.userInfo, forKey: "userInfo")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.advertisingIdentifier = aDecoder.decodeObject(forKey: "advertisingIdentifier") as? String
        self.isBluetoothEnabled = aDecoder.decodeObject(forKey: "isBluetoothEnabled") as? Bool
        self.localeLanguage = aDecoder.decodeObject(forKey: "localeLanguage") as? String
        self.localeRegion = aDecoder.decodeObject(forKey: "localeRegion") as? String
        self.localeScript = aDecoder.decodeObject(forKey: "localeScript") as? String
        self.isLocationServicesEnabled = aDecoder.decodeObject(forKey: "isLocationServicesEnabled") as? Bool
        self.location = aDecoder.decodeObject(forKey: "location") as? LocationSnapshot
        self.locationAuthorization = aDecoder.decodeObject(forKey: "locationAuthorization") as? String
        self.notificationAuthorization = aDecoder.decodeObject(forKey: "notificationAuthorization") as? String
        self.pushToken = aDecoder.decodeObject(forKey: "pushToken") as? PushTokenSnapshot
        self.isCellularEnabled = aDecoder.decodeObject(forKey: "isCellularEnabled") as? Bool
        self.isWifiEnabled = aDecoder.decodeObject(forKey: "isWifiEnabled") as? Bool
        self.appBadgeNumber = aDecoder.decodeObject(forKey: "appBadgeNumber") as? Int
        self.appBuild = aDecoder.decodeObject(forKey: "appBuild") as? String
        self.appIdentifier = aDecoder.decodeObject(forKey: "appIdentifier") as? String
        self.appVersion = aDecoder.decodeObject(forKey: "appVersion") as? String
        if let buildEnvironmentString = aDecoder.decodeObject(forKey: "buildEnvironment") as? String {
            self.buildEnvironment = BuildEnvironment.init(rawValue: buildEnvironmentString)
        }
        self.deviceIdentifier = aDecoder.decodeObject(forKey: "deviceIdentifier") as? String
        self.deviceManufacturer = aDecoder.decodeObject(forKey: "deviceManufacturer") as? String
        self.deviceModel = aDecoder.decodeObject(forKey: "deviceModel") as? String
        self.deviceName = aDecoder.decodeObject(forKey: "deviceName") as? String
        self.operatingSystemName = aDecoder.decodeObject(forKey: "operatingSystemName") as? String
        self.operatingSystemVersion = aDecoder.decodeObject(forKey: "operatingSystemVersion") as? String
        self.screenHeight = aDecoder.decodeObject(forKey: "screenHeight") as? Int
        self.screenWidth = aDecoder.decodeObject(forKey: "screenWidth") as? Int
        self.sdkVersion = aDecoder.decodeObject(forKey: "sdkVersion") as? String
        self.carrierName = aDecoder.decodeObject(forKey: "carrierName") as? String
        self.radio = aDecoder.decodeObject(forKey: "radio") as? String
        self.isTestDevice = aDecoder.decodeObject(forKey: "isTestDevice") as? Bool
        self.timeZone = aDecoder.decodeObject(forKey: "timeZone") as? String
        self.userInfo = aDecoder.decodeObject(forKey: "userInfo") as? Attributes
    }
    
    // MARK: AdSupport
    
    var advertisingIdentifier: String?
    
    // MARK: Bluetooth
    
    var isBluetoothEnabled: Bool?
    
    // MARK: Locale
    
    var localeLanguage: String?
    var localeRegion: String?
    var localeScript: String?

    
    var isLocationServicesEnabled: Bool?
    var location: LocationSnapshot?
    var locationAuthorization: String?
    
    // MARK: Notifications
    
    var notificationAuthorization: String?
    
    // MARK: Push Token
    
    var pushToken: PushTokenSnapshot?
    
    // MARK: Reachability
    
    var isCellularEnabled: Bool?
    var isWifiEnabled: Bool?
    
    // MARK: Static Context
    
    var appBadgeNumber: Int?
    var appBuild: String?
    var appIdentifier: String?
    var appVersion: String?
    var buildEnvironment: BuildEnvironment?
    var deviceIdentifier: String?
    var deviceManufacturer: String?
    var deviceModel: String?
    var deviceName: String?
    var operatingSystemName: String?
    var operatingSystemVersion: String?
    var screenHeight: Int?
    var screenWidth: Int?
    var sdkVersion: String?
    
    // MARK: Telephony
    
    var carrierName: String?
    var radio: String?
    
    // MARK: Testing
    
    var isTestDevice: Bool?
    
    // MARK: Time Zone
    
    var timeZone: String?
    
    // MARK: User Info
    
    var userInfo: Attributes?
    
    init(
        advertisingIdentifier: String? = nil,
        isBluetoothEnabled: Bool? = nil,
        localeLanguage: String? = nil,
        localeRegion: String? = nil,
        localeScript: String? = nil,
        isLocationServicesEnabled: Bool? = nil,
        location: LocationSnapshot? = nil,
        locationAuthorization: String? = nil,
        notificationAuthorization: String? = nil,
        pushToken: PushTokenSnapshot? = nil,
        isCellularEnabled: Bool? = nil,
        isWifiEnabled: Bool? = nil,
        appBadgeNumber: Int? = nil,
        appBuild: String? = nil,
        appIdentifier: String? = nil,
        appVersion: String? = nil,
        buildEnvironment: BuildEnvironment? = nil,
        deviceIdentifier: String? = nil,
        deviceManufacturer: String? = nil,
        deviceModel: String? = nil,
        deviceName: String? = nil,
        operatingSystemName: String? = nil,
        operatingSystemVersion: String? = nil,
        screenHeight: Int? = nil,
        screenWidth: Int? = nil,
        sdkVersion: String? = nil,
        carrierName: String? = nil,
        radio: String? = nil,
        isTestDevice: Bool? = nil,
        timeZone: String? = nil,
        userInfo: Attributes? = nil
    ) {
        self.advertisingIdentifier = advertisingIdentifier
        self.isBluetoothEnabled = isBluetoothEnabled
        self.localeLanguage = localeLanguage
        self.localeRegion = localeRegion
        self.localeScript = localeScript
        self.isLocationServicesEnabled = isLocationServicesEnabled
        self.location = location
        self.locationAuthorization = locationAuthorization
        self.notificationAuthorization = notificationAuthorization
        self.pushToken = pushToken
        self.isCellularEnabled = isCellularEnabled
        self.isWifiEnabled = isWifiEnabled
        self.appBadgeNumber = appBadgeNumber
        self.appBuild = appBuild
        self.appIdentifier = appIdentifier
        self.appVersion = appVersion
        self.buildEnvironment = buildEnvironment
        self.deviceIdentifier = deviceIdentifier
        self.deviceManufacturer = deviceManufacturer
        self.deviceModel = deviceModel
        self.deviceName = deviceName
        self.operatingSystemName = operatingSystemName
        self.operatingSystemVersion = operatingSystemVersion
        self.screenHeight = screenHeight
        self.screenWidth = screenWidth
        self.sdkVersion = sdkVersion
        self.carrierName = carrierName
        self.radio = radio
        self.isTestDevice = isTestDevice
        self.timeZone = timeZone
        self.userInfo = userInfo
    }
}

// MARK: Push Token

class PushTokenSnapshot: NSObject, NSCoding, Codable {
    var value: String
    var timestamp: Date
    
    init(
        value: String,
        timestamp: Date
    ) {
        self.value = value
        self.timestamp = timestamp
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(value, forKey: "value")
        aCoder.encode(timestamp, forKey: "timestamp")
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let value = aDecoder.decodeObject(forKey: "value") as? String else { return nil }
        self.value = String(value)
        guard let timestamp = aDecoder.decodeObject(forKey: "timestamp") as? Date else { return nil }
        self.timestamp = timestamp
    }
}

// MARK: Build Environment

enum BuildEnvironment: String, Codable, Equatable {
    case production = "PRODUCTION"
    case development = "DEVELOPMENT"
    case simulator = "SIMULATOR"
}

// MARK: Location

class CoordinateSnapshot: NSObject, Codable, NSCoding {
    var latitude: Double
    var longitude: Double
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.latitude, forKey: "latitude")
        aCoder.encode(self.longitude, forKey: "longitude")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.latitude = aDecoder.decodeDouble(forKey: "latitude")
        self.longitude = aDecoder.decodeDouble(forKey: "longitude")
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    required init(from decoder: Decoder) throws {
        // we want to represent coordinate as a tuple in our JSON as per our GraphQL API rather than a hash of name-value pairs as the default synthesized implementation of Codable would have done.
        var container = try decoder.unkeyedContainer()
        latitude = try container.decode(Double.self)
        longitude = try container.decode(Double.self)
    }
    
    func encode(to encoder: Encoder) throws {
        // we want to represent coordinate as a tuple in our JSON as per our GraphQL API rather than a hash of name-value pairs as the default synthesized implementation of Codable would have done.
        var container = encoder.unkeyedContainer()
        try container.encode(latitude)
        try container.encode(longitude)
    }
}

class LocationSnapshot: NSObject, Codable, NSCoding {
    var coordinate: CoordinateSnapshot
    var altitude: Double
    var horizontalAccuracy: Double
    var verticalAccuracy: Double
    var address: AddressSnapshot?
    var timestamp: Date
    
    // MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.coordinate, forKey: "coordinate")
        aCoder.encode(self.altitude, forKey: "altitude")
        aCoder.encode(self.horizontalAccuracy, forKey: "horizontalAccuracy")
        aCoder.encode(self.verticalAccuracy, forKey: "verticalAccuracy")
        aCoder.encode(self.address, forKey: "address")
        aCoder.encode(self.timestamp, forKey: "timestamp")
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let coordinate = aDecoder.decodeObject(forKey: "coordinate") as? CoordinateSnapshot else {
            return nil
        }
        self.coordinate = coordinate
        self.altitude = aDecoder.decodeDouble(forKey: "altitude")
        self.horizontalAccuracy = aDecoder.decodeDouble(forKey: "horizontalAccuracy")
        self.verticalAccuracy = aDecoder.decodeDouble(forKey: "verticalAccuracy")
        self.address = aDecoder.decodeObject(forKey: "address") as? AddressSnapshot
        self.timestamp = aDecoder.decodeObject(forKey: "timestamp") as! Date
    }
    
    init(
        coordinate: CoordinateSnapshot,
        altitude: Double,
        horizontalAccuracy: Double,
        verticalAccuracy: Double,
        address: AddressSnapshot?,
        timestamp: Date
        ) {
        self.coordinate = coordinate
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        self.address = address
        self.timestamp = timestamp
    }
}

    
class AddressSnapshot: NSObject, Codable, NSCoding {
    var street: String?
    var city: String?
    var state: String?
    var postalCode: String?
    var country: String?
    var isoCountryCode: String?
    var subAdministrativeArea: String?
    var subLocality: String?
    
    // TODO: NSCoding implementation
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.street, forKey: "street")
        aCoder.encode(self.city, forKey: "city")
        aCoder.encode(self.state, forKey: "state")
        aCoder.encode(self.postalCode, forKey: "postalCode")
        aCoder.encode(self.country, forKey: "country")
        aCoder.encode(self.isoCountryCode, forKey: "isoCountryCode")
        aCoder.encode(self.subAdministrativeArea, forKey: "subAdministrativeArea")
        aCoder.encode(self.subLocality, forKey: "subLocality")
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let street = aDecoder.decodeObject(forKey: "street") as? String else { return nil }
        self.street = String(street)
        guard let city = aDecoder.decodeObject(forKey: "city") as? String else { return nil }
        self.city = String(city)
        guard let state = aDecoder.decodeObject(forKey: "state") as? String else { return nil }
        self.state = String(state)
        guard let postalCode = aDecoder.decodeObject(forKey: "postalCode") as? String else { return nil }
        self.postalCode = String(postalCode)
        guard let country = aDecoder.decodeObject(forKey: "country") as? String else { return nil }
        self.country = String(country)
        guard let isoCountryCode = aDecoder.decodeObject(forKey: "isoCountryCode") as? String else { return nil }
        self.isoCountryCode = String(isoCountryCode)
        guard let subAdministrativeArea = aDecoder.decodeObject(forKey: "subAdministrativeArea") as? String else { return nil }
        self.subAdministrativeArea = String(subAdministrativeArea)
        guard let subLocality = aDecoder.decodeObject(forKey: "subLocality") as? String else { return nil }
        self.subLocality = String(subLocality)
    }
    
    init(
        street: String?,
        city: String?,
        state: String?,
        postalCode: String?,
        country: String?,
        isoCountryCode: String?,
        subAdministrativeArea: String?,
        subLocality: String?
    ) {
        self.street = street
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
        self.isoCountryCode = isoCountryCode
        self.subAdministrativeArea = subAdministrativeArea
        self.subLocality = subLocality
    }
}
