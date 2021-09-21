//
//  LoginViewModel.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import Foundation

class LoginViewModel {
    private let networkManager = NetworkManager()
    
    func login(email: String,
               password: String,
               success: @escaping SuccessHandler,
               failure: @escaping ErrorHandler) {
        networkManager.login(email: email,
                             password: password,
                             success: success,
                             failure: failure)
    }
    
}
