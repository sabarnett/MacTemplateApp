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
    
    init() {
        WriteLog.info("MainViewModel initialising")
    }

    func reset() {
        WriteLog.info("Reset function called")
    }
}

extension MainViewModel {
    func refreshAll() {
        WriteLog.success("Refresh All menu item handled")
        print("Refresh all notification received")
    }
}

extension MainViewModel {
    // Pasteboard handlers
    
    func copyToPasteBoard() {
        PasteBoard.push(selectedItem)
    }
    
    func clearPasteBoard() {
        PasteBoard.clear()
    }

    func getFromPasteBoard() -> String {
        PasteBoard.pop() ?? ""
    }
    
    func hasTextValue() -> Bool {
        PasteBoard.contains(type: .string)
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
//        Alerts.message1()
        
//        if Alerts.areYouSure() == .yes {
//            print("You replied Yes")
//        } else {
//            print("You replied No")
//        }
//        
        if Alerts.deletePrompt(selectedItem: selectedItem) == .delete {
            print("Delete the selected item")
        } else {
            print("Phew, they cancelled so we're keeping it!")
        }
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

//    func initialiseRefreshListener() {
//
//        refreshObserver = NotificationCenter.default.addObserver(
//            forName: Notification.Name(AppNotifications.RefreshAllNotification),
//            object: nil,
//            queue: nil,
//            using: { (userData) in
//                if let userInfo = userData.userInfo as NSDictionary? as! [String: String]? {
//                    print("Sender: \(userInfo["sender"]!)")
//                    print("Target: \(userInfo["target"]!)")
//                    print("Filter: \(userInfo["filter"]!)")
//                }
//
//                DispatchQueue.main.async {
//                    self.refreshAll()
//                }
//            })
//    }
