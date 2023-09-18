//
// File: TemplateAppApp.swift
// Package: TemplateApp
// Created by: Steven Barnett on 13/08/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

@main
struct TemplateAppApp: App {

    @State var appState = AppState()
    @AppStorage("displayMode") var displayMode: DisplayMode = .auto

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(appState)
                .onAppear {
                    setDisplayMode()
                }
        }
        .windowResizability(.contentMinSize)
        .defaultSize(width: Constants.mainWindowWidth, height: Constants.mainWindowHeight)

        .onChange(of: displayMode, perform: { _ in
            setDisplayMode()
        })

        .commands {
            Menus(appState: appState)
        }

        Settings {
            SettingsView()
        }
    }

    fileprivate func setDisplayMode() {
        switch displayMode {
        case .light:
            NSApp.appearance = NSAppearance(named: .aqua)
        case .dark:
            NSApp.appearance = NSAppearance(named: .darkAqua)
        case .auto:
            NSApp.appearance = nil
        }
    }
}
