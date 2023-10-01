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
        initialiseRefreshListener()
    }

    func reset() {
        if let observerObject = refreshObserver {
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
            using: { (_) in
                DispatchQueue.main.async {
                    self.refreshAll()
                }
            })
    }
    
    func refreshAll() {
        print("Refresh all notification received")
    }
}

// Handlers for the menus we added.
extension MainViewModel: MenuHandlerProtocol {
    
    func item1MenuClick() {
        print("Item 1 click handler called")
        selectedItem = items[0]
    }
    
    func item2MenuClick() {
        print("Item 2 click handler called")
        selectedItem = items[1]
    }
    
    func item3MenuClick() {
        print("Item 3 click handler called")
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
