//
// File: Notifications.swift
// Package: Mac Template App
// Created by: Steven Barnett on 27/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import Foundation
import AppKit

struct AppNotifications {
    static let RefreshAllNotification: String = "refreshAllNotification"
    
    static var refreshAll: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for:
            Notification.Name(rawValue:
                AppNotifications.RefreshAllNotification))
    }
}

struct SysNotifications {
    static var willClose: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: NSWindow.willCloseNotification)
    }
}
