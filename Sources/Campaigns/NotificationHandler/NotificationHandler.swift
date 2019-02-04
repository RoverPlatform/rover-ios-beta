//
//  NotificationHandler.swift
//  RoverCampaigns
//
//  Created by Sean Rucker on 2018-06-19.
//  Copyright © 2018 Rover Labs Inc. All rights reserved.
//

import UserNotifications

public protocol NotificationHandler {
    @discardableResult
    func handle(_ response: UNNotificationResponse) -> Bool
}
