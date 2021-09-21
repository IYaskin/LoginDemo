//
//  RegistrationViewModel.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import Foundation

class RegistrationViewModel {
    private let networkManager = NetworkManager()
    
    func register(email: String,
                  password: String,
                  success: @escaping SuccessHandler,
                  failure: @escaping ErrorHandler) {
        networkManager.register(email: email,
                                password: password,
                                success: success,
                                failure: failure)
    }
    
}
