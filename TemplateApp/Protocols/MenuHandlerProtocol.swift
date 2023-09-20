//
// File: MenuHandlerProtocol.swift
// Package: Mac Template App
// Created by: Steven Barnett on 17/09/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

protocol MenuHandlerProtocol {
    func item1MenuClick()
    func item2MenuClick()
    func item3MenuClick()
    
    func isMenuDisabled(_ menuItem: CustomMenuItems) -> Bool
}
