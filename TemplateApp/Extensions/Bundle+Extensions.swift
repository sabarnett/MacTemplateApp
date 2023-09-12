//
// File: Bundle+Extensions.swift
// Package: Mac Template App
// Created by: Steven Barnett on 18/08/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import Foundation

extension Bundle {
    public var appName: String { getInfo("CFBundleName")  }
    public var copyright: String {getInfo("NSHumanReadableCopyright")
        .replacing("\\\\n", with: "\n") }

    public var appBuild: String { getInfo("CFBundleVersion") }
    public var appVersionLong: String { getInfo("CFBundleShortVersionString") }

    fileprivate func getInfo(_ str: String) -> String {
        infoDictionary?[str] as? String ?? "⚠️"
    }
}
