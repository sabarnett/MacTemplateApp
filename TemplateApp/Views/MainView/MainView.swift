//
// File: ContentView.swift
// Package: TemplateApp
// Created by: Steven Barnett on 13/08/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject() var appState: AppState
    @StateObject var vm: MainViewModel = MainViewModel()
    @State var windowNumber: Int = 0
    
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

        HostingWindowFinder { window in
          if let window = window {
              self.appState.addWindowAndModel(window: window,
                                              viewModel: vm)
          }
        }.frame(height: 0)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
