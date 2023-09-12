//
// File: DetailView.swift
// Package: Mac Template App
// Created by: Steven Barnett on 01/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

struct DetailView: View {

    @ObservedObject var vm: MainViewModel

    var body: some View {
        VStack {
            Text("Detail for")
            Text(vm.selectedItem)
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigation) {
                HStack(spacing: 0) {
                    Button(action: { print("Nav_1") },
                           label: { Image(systemName: "1.circle") })
                    .frame(width: 26, height: 32)
                    Button(action: { print("Nav_2") },
                           label: { Image(systemName: "2.circle") })
                    .frame(width: 26, height: 32)
                }
            }

            ToolbarItemGroup(placement: .principal) {
                Button(action: { print("Prn_1") },
                       label: { Image(systemName: "3.circle") })
                Button(action: { print("Prn_2") },
                       label: { Image(systemName: "4.circle") })
            }

            ToolbarItemGroup(placement: .primaryAction) {
                Spacer()
                Button(action: { print("Pri_1") },
                       label: { Image(systemName: "5.circle") })
                Button(action: { print("Pri_2") },
                       label: { Image(systemName: "6.circle") })
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(vm: MainViewModel())
    }
}
