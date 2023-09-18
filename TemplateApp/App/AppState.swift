//
// File: AppState.swift
// Package: Mac Template App
// Created by: Steven Barnett on 16/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

class AppState: NSObject, ObservableObject {
    
    // all currently opened windows and their view models
    private var windows = Set<NSWindow>()
    private var viewModels: [Int: MenuHandlerProtocol] = [:]
    
    // currently active window and view model
    public var activeWindow: NSWindow?
    public var activeViewModel: MenuHandlerProtocol?
    
    // Add a new window and it's view model to the tracking list and
    // since it's a new window, set it as the currently selected window/view model
    func addWindowAndModel(window: NSWindow, viewModel: MenuHandlerProtocol) {
        window.delegate = self
        windows.insert(window)
        
        let windowNumber = window.windowNumber
        viewModels[windowNumber] = viewModel
        
        activeViewModel = viewModels[windowNumber]
        activeWindow = windows.first(where: { win in win.windowNumber == windowNumber})
    }
}

extension AppState: NSWindowDelegate {
    // When we close a window, make sure it's removed from the tracking list
    func windowWillClose(_ notification: Notification) {
        guard let window = notification.object as? NSWindow else { return }

        windows.remove(window)
        viewModels.removeValue(forKey: window.windowNumber)
    }
    
    // When a window becomes active, make sure we update the current window/view model
    func windowDidBecomeKey(_ notification: Notification) {
        guard let window = notification.object as? NSWindow else { return }
        
        activeWindow = window
        activeViewModel = viewModels[window.windowNumber]
    }
}
