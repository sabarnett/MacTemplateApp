//
// File: SettingsViewModel.swift
// Package: Mac Template App
// Created by: Steven Barnett on 21/08/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

class SettingsViewModel: ObservableObject {

    // General tab options
    @AppStorage("setting1") var toggle1: Bool = false
    @AppStorage("setting2") var toggle2: Bool = false
    @AppStorage("setting3") var toggle3: Bool = false
    @AppStorage("displayMode") var displayMode: DisplayMode = .auto

    // Set 1 settings
    @AppStorage("SupportEmail") var supportEmail: String = ""
    @AppStorage("ExperienceLevel") var experienceLevel: UserExperience = .beginner
    @AppStorage("yearsExperience") var yearsExperience: Double = 1.0

    // Advanced Settings extra options
    @AppStorage("ExperienceLevelMin") var experienceLevelMin: UserExperience = .beginner

}
