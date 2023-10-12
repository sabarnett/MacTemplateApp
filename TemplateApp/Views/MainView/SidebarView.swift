//
// File: SidebarView.swift
// Package: Mac Template App
// Created by: Steven Barnett on 01/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

struct SidebarView: View {

    @ObservedObject var vm: MainViewModel

    var body: some View {
        VStack {
            toolbarIcons()
            var _ = WriteLog.debug("itemCount: \(vm.items.count)")

            List(vm.items, id: \.self, selection: $vm.selectedItem) { item in
                Text(item)
                    .onTapGesture {
                        vm.selectedItem = item
                    }
            }
            Spacer()
        }
    }

    func toolbarIcons() -> some View {
        VStack {
            Divider()
            HStack {
                ToolButton(systemName: "1.square",
                           helpText: "Click for option 1") {
                    print("1 square clicked")
                }
                ToolButton(systemName: "2.square",
                           helpText: "Click for option 2") {
                    print("2 square clicked")
                }
                ToolButton(systemName: "3.square",
                           helpText: "Click for option 3") {
                    print("3 square clicked")
                }

                Spacer()
            }
            .padding(.vertical, 1)
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity)
            .opacity(0.6)

            Divider()
        }
    }
}

struct ToolButton: View {

    let systemName: String
    var helpText: String?
    let action: (() -> Void)

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: systemName)
                .scaleEffect(1.3)
        })
        .buttonStyle(.plain)
        .help(helpText ?? "")
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(vm: MainViewModel())
    }
}
