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
    
    public static func selectSingleDataFile(withTitle windowTitle: String?) -> URL? {
        return selectSingleInputFile(ofType: [.dataFileType], withTitle: windowTitle)
    }
    
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
    
    // MARK: - Save Functions
    
    public static func selectImageFileToSave(withTitle windowTitle: String?) -> URL? {
        let imageTypes: [UTType] = [.image]
        return selectSaveFile(ofType: imageTypes, withTitle: windowTitle)
    }
    
    public static func selectSaveFile(ofType fileTypes: [UTType], withTitle windowTitle: String?) -> URL? {

        let openPrompt = FileHelpers().createSavePanel(ofType: fileTypes, withTitle: windowTitle)

        let result = openPrompt.runModal()

        if result == NSApplication.ModalResponse.OK {
            let fName = openPrompt.url
            return fName
        }

        return nil
    }
    
    // MARK: - Folder selection
    
    public static func selectFolder() -> URL? {

        let openPrompt = FileHelpers().createOpenPanel(ofType: [], withTitle: nil)

        openPrompt.canChooseDirectories = true
        openPrompt.canChooseFiles = false
        let result = openPrompt.runModal()

        if result == NSApplication.ModalResponse.OK {
            let fName = openPrompt.urls

            guard fName.count == 1 else { return nil }
            return fName[0].absoluteURL
        }

        return nil
    }

    // MARK: - Private helpers
    
    private func createSavePanel(ofType: [UTType], withTitle: String?) -> NSSavePanel {

        let openPrompt = NSSavePanel()

        if let titlePrompt = withTitle {
            openPrompt.message = titlePrompt
        }

        openPrompt.allowsOtherFileTypes = true
        openPrompt.canCreateDirectories = true
        openPrompt.prompt = "Save As..."
        openPrompt.allowedContentTypes = ofType
        openPrompt.nameFieldLabel = "Enter file name:"
        openPrompt.nameFieldStringValue = "file"

        return openPrompt
    }
    
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
