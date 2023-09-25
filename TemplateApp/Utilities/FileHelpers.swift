//
// File: FileHelpers.swift
// Package: Mac Template App
// Created by: Steven Barnett on 25/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import Foundation
import AppKit
import UniformTypeIdentifiers

struct FileHelpers {
    
    public static func selectSingleImageFile(withTitle windowTitle: String?) -> URL? {
        let imageTypes: [UTType] = [UTType.image]
        
        return selectSingleInputFile(ofType: imageTypes, withTitle: windowTitle)
    }
    
    public static func selectSingleInputFile(ofType fileTypes: [UTType], withTitle windowTitle: String?) -> URL? {

        let openPrompt = FileHelpers().createOpenPanel(ofType: fileTypes, withTitle: windowTitle)

        let result = openPrompt.runModal()

        if result == NSApplication.ModalResponse.OK {
            let fName = openPrompt.urls

            guard fName.count == 1 else { return nil }
            return fName[0].absoluteURL
        }

        return nil
    }

    // MARK: - Private helpers
    
    private func createOpenPanel(ofType: [UTType],
                                 withTitle: String?,
                                 allowsMultiple: Bool = false) -> NSOpenPanel {

        let openPrompt = NSOpenPanel()

        if let titlePrompt = withTitle {
            openPrompt.message = titlePrompt
        }

        openPrompt.allowsMultipleSelection = allowsMultiple
        openPrompt.canChooseDirectories = false
        openPrompt.canChooseFiles = true
        openPrompt.resolvesAliases = true
        openPrompt.allowedContentTypes = ofType

        return openPrompt
    }
}
