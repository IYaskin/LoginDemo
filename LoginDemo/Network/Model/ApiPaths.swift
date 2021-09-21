//
//  ApiPaths.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import Foundation

enum ApiPaths: String {
    case login = "/api/v1/security/sign-in"
    case register = "/api/v1/security/sign-up"
    case refreshToken = "/api/v1/security/token/refresh"
    case colors = "/api/v1/color-type/list"
}
