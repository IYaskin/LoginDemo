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
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badResponse:
            return "badResponse"
        case .parseError:
            return "parseError"
        }
    }
}
