//
// File: About.swift
// Package: Mac Template App
// Created by: Steven Barnett on 18/08/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

struct AboutView: View {

    var body: some View {
        VStack(spacing: 10) {
            Image(nsImage: NSImage(named: "AppIcon")!)

            Text("\(Bundle.main.appName)")
                .font(.system(size: 20, weight: .bold))
                .textSelection(.enabled)

            Link(Constants.homeAddress,
                 destination: Constants.homeUrl )

            Text("Ver: \(Bundle.main.appVersionLong) (\(Bundle.main.appBuild)) ")
                .textSelection(.enabled)

            Text(Bundle.main.copyright)
                .font(.system(size: 10, weight: .thin))
                .multilineTextAlignment(.center)
        }
        .padding(20)
        .frame(minWidth: 350, minHeight: 300)
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
