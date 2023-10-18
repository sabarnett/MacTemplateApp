//
// File: PasteBoard.swift
// Package: Mac Template App
// Created by: Steven Barnett on 14/10/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import Foundation
import AppKit

struct PasteBoard {
    
    public static func clear() {
        NSPasteboard.general.clearContents()
    }
    
    public static func push(_ text: String) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(text, forType: .string)
    }
    
    public static func pop(type: NSPasteboard.PasteboardType = .string) -> String? {
        NSPasteboard.general.string(forType: type)
    }
    
    public static func contains(type: NSPasteboard.PasteboardType) -> Bool {
        guard let items = NSPasteboard.general.pasteboardItems else { return false }
        return items.filter({ $0.types.contains(type) }).count > 0
    }
}
