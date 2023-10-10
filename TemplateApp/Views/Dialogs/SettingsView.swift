//
// File: SettingsView.swift
// Package: Mac Template App
// Created by: Steven Barnett on 19/08/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

struct SettingsView: View {

    @StateObject private var settings = SettingsViewModel()

    var body: some View {
        TabView {
            generalSettings()
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }

            set1Settings()
                .tabItem {
                    Label("One", systemImage: "square.and.arrow.up")
                }

            advancedSettings()
                .tabItem {
                    Label("Advanced", systemImage: "gearshape.2")
                }
        }
        .frame(width: Constants.settingsWindowWidth)
    }

    private func generalSettings() -> some View {
        VStack {
            Text("These are the general settings and these are some instructions to the user.")

            Toggle(isOn: $settings.toggle1, label: { Text("This is setting 1")})
            Toggle(isOn: $settings.toggle2, label: { Text("This is setting 2")})
            Divider()
            Toggle(isOn: $settings.toggle3, label: { Text("This is setting 3")})

            Divider()
            Picker(selection: $settings.displayMode, content: {
                ForEach(DisplayMode.allCases) { mode in
                    Text(mode.description).tag(mode)
                }
            }, label: {
                Text("Display mode")
            })
        }.padding(15)
    }

    private func set1Settings() -> some View {
        VStack {
            HStack {
                Text("Support email:")
                TextField("Your email", text: $settings.supportEmail)
            }
            Picker("Experience Level", selection: $settings.experienceLevel) {
                ForEach(UserExperience.allCases, id: \.self) { level in
                    Text(level.rawValue.capitalized)
                }
            }
            HStack {
                Slider(value: $settings.yearsExperience,
                       in: 1...11,
                       label: { Text("Years Experience")},
                       minimumValueLabel: {Text("1")},
                       maximumValueLabel: {Text(">10")})
                Text(String(format: "%.0f", settings.yearsExperience))
                    .font(.caption)
            }
            Button("Reset Settings") { print("Reset settings") }
        }.padding(15)
    }

    private func advancedSettings() -> some View {
        VStack {
            SettingsLine(label: "Support Email:", content: {TextField("Your email", text: $settings.supportEmail)
                    .padding(.leading, 10)
            })

            SettingsLine(label: "Experience Level:", content: {
                Picker("", selection: $settings.experienceLevel) {
                    ForEach(UserExperience.allCases, id: \.self) { level in
                        Text(level.rawValue.capitalized)
                    }
                }
            })

            SettingsLine(label: "Experience Level Minimum:", content: {
                Picker("", selection: $settings.experienceLevelMin) {
                    ForEach(UserExperience.allCases, id: \.self) { level in
                        Text(level.rawValue.capitalized)
                    }
                }
            })

            SettingsLine(label: "", content: {
                Toggle(isOn: $settings.toggle1, label: { Text("This is setting 1")})
                    .padding(8)
            })

            SettingsLine(label: "", content: {
                Toggle(isOn: $settings.toggle2, label: { Text("This is setting 2")})
                    .padding(8)
            })

            SettingsLine(label: "Years of experience:", content: {
                HStack {
                    Slider(value: $settings.yearsExperience,
                           in: 1...11,
                           label: { Text("")})
                    if settings.yearsExperience == 11 {
                        Text(">10")
                            .font(.caption)
                    } else {
                        Text(String(format: "%.0f", settings.yearsExperience))
                            .font(.caption)
                    }
                }
            })
        }.padding(15)
    }
}

struct SettingsLine<Content: View>: View {
    var content: () -> Content
    var label: String

    init(label: String, @ViewBuilder content: @escaping () -> Content) {
        self.label = label
        self.content = content
    }

    var body: some View {
        HStack {
            Text(label)
                .frame(width: Constants.settingsWindowLabelWidth, alignment: .topTrailing)

            HStack {
                content()
                    .padding(.trailing, 16)
            }
        }
        .frame(width: Constants.settingsWindowWidth)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
