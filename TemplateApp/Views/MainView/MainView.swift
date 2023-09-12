//
// File: ContentView.swift
// Package: TemplateApp
// Created by: Steven Barnett on 13/08/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

struct MainView: View {

    @StateObject var vm: MainViewModel = MainViewModel()

    var body: some View {
        NavigationSplitView(sidebar: {
            SidebarView(vm: vm)
                .frame(minWidth: Constants.mainWindowSidebarMinWidth)
        }, detail: {
            DetailView(vm: vm)
        })
        .frame(minWidth: Constants.mainWindowMinWidth,
               minHeight: Constants.mainWindowMinHeight)
        .navigationTitle(Constants.mainWindowTitle)
//        .navigationSubtitle("This is a sub-title.")

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
