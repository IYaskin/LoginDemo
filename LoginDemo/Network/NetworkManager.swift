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
        networkService.postRequest(path: .register,
                                   params: ["email": email,
                                            "password": password],
                                   success: success,
                                   failure: failure)
    }
    
    func getColors(success: @escaping SuccessHandler,
                   failure: @escaping ErrorHandler) {
        updateTokenIfNeeded(completion: { [self] in
            networkService.getRequest(path: .colors,
                                      success: success,
                                      failure: failure)
        },
                            failure: failure)
    }
    
    func updateTokenIfNeeded(completion: @escaping ()->Void,
                             failure: @escaping ErrorHandler) {
        guard let tokenData = AccountSettings.shared.tokenData,
              let tokenExpiredAtString = tokenData.tokenExpiredAt,
              let refreshToken = tokenData.refreshToken else {
            failure(NetworkError.noBearerToken)
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        guard let tokenExpiredAtDate = dateFormatter.date(from: tokenExpiredAtString) else {
            failure(NetworkError.cantReadTokenExpiredAt)
            return
        }
        let now = Date()
        print(tokenExpiredAtDate)
        print(now)
        
        guard tokenExpiredAtDate < now else {
            completion()
            return
        }

        networkService.postRequest(path: .refreshToken,
                                   params: ["refreshToken": refreshToken],
                                   success: { data in
                                    AccountSettings.shared.save(data: data)
                                    completion()
                                   },
                                   failure: failure)

    }
}
