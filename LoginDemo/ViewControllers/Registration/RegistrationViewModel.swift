//
//  RegistrationViewModel.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import Foundation

class RegistrationViewModel {
    private let networkManager = NetworkManager()
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func validateEmailAndPassword(email: String?,
                                  password: String?) -> Error? {
        guard let email = email,
              !email.isEmpty,
              isValidEmail(email) else {
            return ValidationError.incorrectEmail
        }
        
        guard let password = password,
              !password.isEmpty,
              password.count >= 6 else {
            return ValidationError.shortPassword
        }
        
        return nil
    }
    
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

    func register(email: String,
                  password: String,
                  success: @escaping SuccessHandler,
                  failure: @escaping ErrorHandler) {
        print("Email = \(email)\nPassword = \(password)")
        networkManager.register(email: email,
                                password: password,
                                success: success,
                                failure: failure)
    }
    
}
