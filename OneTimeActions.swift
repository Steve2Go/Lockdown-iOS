//
//  OneTimeActions.swift
//  LockdowniOS
//
//  Created by Oleg Dreyman on 28.05.2020.
//  Copyright © 2020 Confirmed Inc. All rights reserved.
//

import Foundation

enum OneTimeActions {
    
    enum Flag: String {
        case welcomeScreen = "LockdownHasSeenWelcomePopup"
        case notificationAuthorizationRequestPopup = "LockdownHasSeenNotificationAuthorizationRequestPopup"
        case oneHundredTrackingAttemptsBlockedNotification = "LockdownHasScheduledOneHundredTrackingAttemptsBlockedNotification"
        case newEnableNotificationsController = "LockdownHasSeenNewEnableNotificationsController"
    }
    
    static func hasSeen(_ flag: Flag) -> Bool {
        return defaults.bool(forKey: flag.rawValue)
    }
    
    static func markAsSeen(_ flag: Flag) {
        defaults.set(true, forKey: flag.rawValue)
    }
    
    static func performOnce(ifHasNotSeen flag: Flag, action: () -> ()) {
        if hasSeen(flag) {
            return
        } else {
            markAsSeen(flag)
            action()
        }
    }
}
