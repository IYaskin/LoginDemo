//
//  Colors.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 24.09.2021.
//

import Foundation

struct Colors: Codable {
    var type: String
    var possibleColors: [Color]
}

struct Color: Codable {
    var color: String
    var hexValues: [String]
}
