//
// File: AppState.swift
// Package: Mac Template App
// Created by: Steven Barnett on 16/09/2023
//
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

class AppState: NSObject, ObservableObject {
    
    // All registered view models, indexed by their window number
    private var viewModels: [Int: MenuHandlerProtocol] = [:]
    
    // Currently active view model
    @Published var activeViewModel: MenuHandlerProtocol?
    
    override init() {
        super.init()
        
        // Setup subscription for windowWillClose notification
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(removeViewModel),
                                               name: NSWindow.willCloseNotification,
                                               object: nil)
     
        // Setup subscription for didBecomeKey notification
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(windowBecameKey),
                                               name: NSWindow.didBecomeKeyNotification,
                                               object: nil)
    }
    
    @objc
    /// Removes a view model from our set of view models when the window is closed. This
    /// releases reference so the view and it's view model can be deleted correctly.
    /// - Parameter message: The notification message. The object property
    ///     will be the NSWindow that was closed.
    func removeViewModel(message: NSNotification) {
        guard let win = message.object as? NSWindow,
              viewModels[win.windowNumber] != nil
        else { return }
        
        activeViewModel = nil
        viewModels.removeValue(forKey: win.windowNumber)
    }
    
    @objc
    /// A window has become active. If it's one of our registered windows, then we need
    /// to make it's view model the currently active view model.
    /// - Parameter message: The notification message. The object property
    ///             will be the NSWindow that became active.
    func windowBecameKey(message: NSNotification) {
        guard let win = message.object as? NSWindow,
              viewModels[win.windowNumber] != nil
        else { return }
        
        activeViewModel = viewModels[win.windowNumber]
    }
    
    // Add a new view model to the tracking list and, since it's a new
    // window, set it as the currently selected view model
    func addWindowAndModel(window: NSWindow, viewModel: MenuHandlerProtocol) {
        let windowNumber = window.windowNumber
        
        viewModels[windowNumber] = viewModel
        activeViewModel = viewModel
    }
}
