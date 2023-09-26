//
// File: UTType+Extensions.swift
// Package: Mac Template App
// Created by: Steven Barnett on 26/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//
        
import Foundation
import UniformTypeIdentifiers

/*
 Handles adding a custom file type to our app. To properly 
 coordinate this change, you need to review the following items:
 
 Project Settings -> Target -> info tab.
 
 Review the Document Types for the App Data File.
 Review the Exported Type Identifiers.
 
 Ensure that you change the Identifier and Extensions to match
 your needs.
 
 Then, update the extension below for the updated identifier.
 
 */
extension UTType {
    static var dataFileType: UTType {
        UTType("uk.co.sabarnett.template.xyz")!
    }
}
