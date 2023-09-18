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
    
    @ObservedObject var appState: AppState
    
    @AppStorage("displayMode") var displayMode: DisplayMode = .auto
    @AppStorage("setting1") var toggle1: Bool = false
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Commands {
        ToolbarCommands()
        SidebarCommands()
        
        // Replace the About menu item.
        CommandGroup(replacing: CommandGroupPlacement.appInfo) {
            Button("About \(Bundle.main.appName)") {
                appDelegate.showAboutWnd()
            }
        }
        
        CommandGroup(before: CommandGroupPlacement.help) {
            Link(Constants.homeAddress,
                 destination: Constants.homeUrl)
            Divider()
        }
        
        CommandGroup(after: CommandGroupPlacement.newItem) {
            Button("New from template") {
                print("New from template")
            }
        }
        
        CommandGroup(before: CommandGroupPlacement.appTermination) {
            Button("Discard Changes") {
                print("Discard Changes")
            }
        }
        
        CommandGroup(replacing: CommandGroupPlacement.undoRedo) {
            EmptyView()
        }
        
        CommandMenu("Display") {
            Button("Item 1") {
                guard let vm = appState.activeViewModel  else { return }
                vm.item1MenuClick()
            }
            Button("Item 2") {
                guard let vm = appState.activeViewModel else { return }
                vm.item2MenuClick()
            }
            Divider()
            Button("Item 3") {
                guard let vm = appState.activeViewModel else { return }
                vm.item3MenuClick()
            }
            
            Divider()
            Toggle(isOn: $toggle1) { Text("Setting 1") }
            
            Divider()
            Picker(selection: $displayMode, content: {
                ForEach(DisplayMode.allCases) { mode in
                    Text(mode.description).tag(mode)
                }
            }, label: {
                Text("Display mode")
            })
        }
    }
}
