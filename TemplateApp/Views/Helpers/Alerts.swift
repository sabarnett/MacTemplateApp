//
// File: Alerts.swift
// Package: Mac Template App
// Created by: Steven Barnett on 19/10/2023
//
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

// swiftlint:disable identifier_name
enum AlertResponse {
    case yes
    case no
    case delete
    case cancel
}
// swiftlint:enable identifier_name

struct Alerts {
    public static func message1() {
        Alerts().openAlert(title: "Message 1 Title", message: "Message content for message 1. We do not expect a response.")
    }
    
    public static func areYouSure() -> AlertResponse {
        // Returns      1000, 1001
        let captions = ["No", "Yes"]
        let result = Alerts().openAlert(title: "Are you sure?",
                           message: "Are you sure you want to do this. Yes to continue, No to cancel",
                           buttonTitles: captions)
        
        return (result.rawValue == 1000) ? .no : .yes
    }
    
    public static func deletePrompt(selectedItem: String?) -> AlertResponse {
        // Returns      1000, 1001
        let captions = ["*Delete", "Cancel"]
        let result = Alerts().openAlert(title: "Delete?",
                           message: "Are you sure you want to delete \(selectedItem ?? "unknown")?",
                           buttonTitles: captions)
        
        return (result.rawValue == 1000) ? .delete : .cancel
    }

    @discardableResult
    func openAlert(title: String, message: String, buttonTitles: [String] = []) -> NSApplication.ModalResponse {
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = message
        
        for buttonTitle in buttonTitles {
            if buttonTitle.starts(with: "*") {
                let button = alert.addButton(withTitle: buttonTitle.replacing("*", with: "", maxReplacements: 1))
                button.bezelStyle = .rounded
                button.bezelColor = NSColor.systemRed
            } else {
                
                alert.addButton(withTitle: buttonTitle)
            }
        }
        
        NSApp.activate(ignoringOtherApps: true)
        
        let response = alert.runModal()
        return response
    }
}

//    func breakOver() -> NSApplication.ModalResponse {
//        let message = "Your break time has finished.\n\n" +
//        "Start your next task now or use the menu to start it when you're ready."
//
//        let buttonTitles = ["Start Next Task", "OK"]
//
//        let response = openAlert(
//            title: "Break Over",
//            message: message,
//            buttonTitles: buttonTitles)
//        return response
//    }
//
