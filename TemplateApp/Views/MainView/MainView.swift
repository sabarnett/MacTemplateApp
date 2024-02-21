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
    @State var windowNumber: Int = 0
    
    var body: some View {
        var _ = WriteLog.debug("windowNumber: \(windowNumber)")

        NavigationSplitView(sidebar: {
            SidebarView(vm: vm)
                .frame(minWidth: Constants.mainWindowSidebarMinWidth)
        }, detail: {
            DetailView(vm: vm)
        })
        .frame(minWidth: Constants.mainWindowMinWidth,
               minHeight: Constants.mainWindowMinHeight)
        .navigationTitle(Constants.mainWindowTitle)
        .focusedSceneObject(vm)
//        .navigationSubtitle("This is a sub-title.")
        
        .onReceive(AppNotifications.refreshAll) { params in
            if let userData: [AnyHashable: Any] = params.userInfo {
                for keyValue in userData {
                    let _ = WriteLog.debug("Key:",
                                           keyValue.key,
                                           ", Value:",
                                           keyValue.value)
                }
            }
            vm.refreshAll()
        }
        
        .onReceive(SysNotifications.willClose) { newValue in
            guard let win = newValue.object as? NSWindow,
                  win.windowNumber == windowNumber
            else { return }
            
            vm.reset()
        }
        
        HostingWindowFinder { window in
          if let window = window {
              windowNumber = window.windowNumber
          }
        }.frame(height: 0)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
