//
//  ValidationError.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 23.09.2021.
//

import Foundation

enum ValidationError: Error {
    case incorrectEmail
    case shortPassword
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .incorrectEmail:
            return "Введен некорректный e-mail"
        case .shortPassword:
            return "Пароль должен содержать не менее 6 символов"
        }
    }
}
