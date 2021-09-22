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
               success: @escaping () -> Void,
               failure: @escaping ErrorHandler) {
        print("Email = \(email)\nPassword = \(password)")
        networkManager.login(email: email,
                             password: password,
                             success: { data in
                                AccountSettings.shared.save(data: data)
                                success()
                             },
                             failure: failure)
    }
    
}
