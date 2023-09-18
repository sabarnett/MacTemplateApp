//
// File: HostingViewFinder.swift
// Package: Mac Template App
// Created by: Steven Barnett on 17/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//
   
import SwiftUI

struct HostingWindowFinder: NSViewRepresentable {
    var callback: (NSWindow?) -> Void
    
    func makeNSView(context: Self.Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async { [weak view] in
            self.callback(view?.window)
        }
        return view
    }
    func updateNSView(_ nsView: NSView, context: Context) {}
}
