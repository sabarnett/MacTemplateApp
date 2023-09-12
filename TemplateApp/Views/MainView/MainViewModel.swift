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
