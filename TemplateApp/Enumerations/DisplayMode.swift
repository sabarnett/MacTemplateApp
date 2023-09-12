//
// File: DisplayMode.swift
// Package: Mac Template App
// Created by: Steven Barnett on 09/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import Foundation

enum DisplayMode: String, Identifiable, CaseIterable, Equatable {
    case light
    case dark
    case auto

    var id: String {
        return self.description
    }

    var description: String {
        switch self {
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        case .auto:
            return "Auto"
        }
    }
}
