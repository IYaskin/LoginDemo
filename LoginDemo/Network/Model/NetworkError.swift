//
//  NetworkError.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case parseError
    case noBearerToken
    case cantReadTokenExpiredAt
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badResponse:
            return "Ошибка от сервера :("
        case .parseError:
            return "Ошибка парсинга :("
        case .noBearerToken:
            return "Ошибка токена :("
        case .cantReadTokenExpiredAt:
            return "Ошибка даты токена :("
        }
    }
}
