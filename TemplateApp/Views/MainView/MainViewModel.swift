//
// File: MainViewModel.swift
// Package: Mac Template App
// Created by: Steven Barnett on 07/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import Foundation

class MainViewModel: ObservableObject, Identifiable {
    var id: UUID = UUID()

    @Published var items: [String] = ["Mabel", "Morag", "Marcia"]
    @Published var selectedItem: String = ""

    weak var refreshObserver: NSObjectProtocol?
    
    init() {
        WriteLog.info("MainViewModel initialising")
        initialiseRefreshListener()
    }

    func reset() {
        WriteLog.info("Reset function called")
        if let observerObject = refreshObserver {
            WriteLog.info("Observer being removed")
            NotificationCenter.default.removeObserver(observerObject)
        }
    }
}

extension MainViewModel {
    
    func initialiseRefreshListener() {
        
        refreshObserver = NotificationCenter.default.addObserver(
            forName: Notification.Name(AppNotifications.RefreshAllNotification),
            object: nil,
            queue: nil,
            using: { (userData) in
                if let userInfo = userData.userInfo as NSDictionary? as! [String: String]? {
                    print("Sender: \(userInfo["sender"]!)")
                    print("Target: \(userInfo["target"]!)")
                    print("Filter: \(userInfo["filter"]!)")
                }
                
                DispatchQueue.main.async {
                    self.refreshAll()
                }
            })
    }
    
    func refreshAll() {
        WriteLog.success("Refresh All menu item handled")
        print("Refresh all notification received")
    }
}

// Handlers for the menus we added.
extension MainViewModel: MenuHandlerProtocol {
    
    func item1MenuClick() {
        WriteLog.debug("Item 1 click handler called")
        selectedItem = items[0]
    }
    
    func item2MenuClick() {
        WriteLog.debug("Item 2 click handler called")
        selectedItem = items[1]
    }
    
    func item3MenuClick() {
        WriteLog.debug("Item 3 click handler called")
        selectedItem = items[2]
    }
    
    func isMenuDisabled(_ menuItem: CustomMenuItems) -> Bool {
        switch menuItem {
        case .menuItem1:
            return true
        case .menuItem2:
            return false
        case .menuItem3:
            return false
        }
    }
}
