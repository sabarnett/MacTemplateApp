//
// File: Menus.swift
// Package: Mac Template App
// Created by: Steven Barnett on 12/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//
        
import Foundation
import SwiftUI

struct Menus: Commands {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Commands {
        // Replace the About menu item. 
        CommandGroup(replacing: CommandGroupPlacement.appInfo) {
            Button("About \(Bundle.main.appName)") {
                appDelegate.showAboutWnd()
            }
        }
    }
}
