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
        
        FileCommands()
        
        CommandGroup(before: CommandGroupPlacement.appTermination) {
            Button("Discard Changes") {
                print("Discard Changes")
            }
        }
        
        CommandGroup(replacing: CommandGroupPlacement.undoRedo) {
            EmptyView()
        }
        
        DisplayCommands(appState: appState)
    }
}

public struct DisplayCommands: Commands {
    
    @ObservedObject var appState: AppState
    
    @AppStorage("displayMode") var displayMode: DisplayMode = .auto
    @AppStorage("setting1") var toggle1: Bool = false
    
    public var body: some Commands {
        /* Adding Menu Items
         
         Requirements for a new menu item:
         
         1. Add a button to the menus file.
         2. Update the MenuHandlerProtocol file to add a click handler if you
            expect the view model to handle the click.
         3. Update the MainViewModel extension to add a click handler.
         4. Update the CustomMenuItems enum file to add an id for the new menu
            item if you expect to view model to be able to eable/disable the menu item.
         5. Update the MainViewModel extension to handle enabling/disabling the menu item.
         
         Files to update:
         * Menus.swift
         * MenuHandlerProtocol.swift
         * MainViewModel.swift
         
         */
        CommandMenu("Display") {
            Button("Item 1") {
                guard let vm = appState.activeViewModel  else { return }
                vm.item1MenuClick()
            }.disabled(appState.activeViewModel?.isMenuDisabled(.menuItem1) ?? true)
            
            Button("Item 2") {
                guard let vm = appState.activeViewModel else { return }
                vm.item2MenuClick()
            }.disabled(appState.activeViewModel?.isMenuDisabled(.menuItem2) ?? true)
            
            Divider()
            Button("Item 3") {
                guard let vm = appState.activeViewModel else { return }
                vm.item3MenuClick()
            }.disabled(appState.activeViewModel?.isMenuDisabled(.menuItem3) ?? true)

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

public struct FileCommands: Commands {

    public var body: some Commands {

        CommandGroup(before: CommandGroupPlacement.newItem) {
            Button("Open") {
                if let selectedFile = FileHelpers.selectSingleImageFile(withTitle: "Selecvt an image") {
                    print("You selected: \(selectedFile)")
                } else {
                    print("You cancelled the open request.")
                }
            }
            Divider()
        }
    
        CommandGroup(after: CommandGroupPlacement.newItem) {
            Button("New from template") {
                print("New from template")
            }
        }

        CommandGroup(after: CommandGroupPlacement.newItem) {
            Divider()
            Button("Save-As") {
                print("Save a file as")
            }
        }
        
        CommandGroup(after: CommandGroupPlacement.newItem) {
            Divider()
            Button("Select Filder") {
                print("Select a folder")
            }
        }
    }
}
