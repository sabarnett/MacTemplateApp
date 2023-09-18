//
// File: MainViewModel.swift
// Package: Mac Template App
// Created by: Steven Barnett on 07/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import Foundation

class MainViewModel: ObservableObject {

    @Published var items: [String] = ["Mabel", "Morag", "Marcia"]
    @Published var selectedItem: String = ""

}

// Handlers for the menus we added.
extension MainViewModel: MenuHandlerProtocol {
    
    func item1MenuClick() {
        print("Item 1 click handler called")
    }
    
    func item2MenuClick() {
        print("Item 2 click handler called")
    }
    
    func item3MenuClick() {
        print("Item 3 click handler called")
    }
}
