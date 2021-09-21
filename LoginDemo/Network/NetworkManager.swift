//
//  NetworkManager.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import Foundation

class NetworkManager {
    
    private let networkService = NetworkService.shared
    
    func login(email: String,
               password: String,
               success: @escaping SuccessHandler,
               failure: @escaping ErrorHandler) {
        networkService.postRequest(path: .login,
                                   params: ["username": email,
                                            "password": password],
                                   success: success,
                                   failure: failure)
    }

    
    func register(email: String,
                  password: String,
                  success: @escaping SuccessHandler,
                  failure: @escaping ErrorHandler) {
        networkService.postRequest(path: .login,
                                   params: ["username": email,
                                            "password": password],
                                   success: success,
                                   failure: failure)
    }
    
}
