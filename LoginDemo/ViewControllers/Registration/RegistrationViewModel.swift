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
                  success: @escaping () -> Void,
                  failure: @escaping ErrorHandler) {
        networkManager.register(email: email,
                                password: password,
                                success: { data in
                                   AccountSettings.shared.save(data: data)
                                   success()
                                },
                                failure: failure)
    }
    
}
