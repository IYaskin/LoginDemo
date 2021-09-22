//
//  AccountSettings.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 22.09.2021.
//

import Foundation

struct User: Codable {
    var email: String?
}

struct TokenData: Codable {
    var user: User?
    var token: String?
    var tokenTtl: String?
    var tokenExpiredAt: String?
    var refreshToken: String?
    var refreshTokenTtl: String?
    var refreshTokenExpiredAt: String?
}

class AccountSettings {
    
    static let shared = AccountSettings()
    private init(){}
    
    var isLogin: Bool {
        tokenData != nil
    }
    
    var tokenData: TokenData? {
        get {
            if let data = UserDefaults.standard.data(forKey: "tokenData"),
                let tokenData = try? JSONDecoder().decode(TokenData.self, from: data) {
                return tokenData
            }
            return nil
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                print("Settings  saved")
                UserDefaults.standard.set(data, forKey: "tokenData")
            } else {
                print("Settings not saved")
            }
        }
    }
    
    func deleteAccount() {
        print("Delete Account")
        UserDefaults.standard.removeObject(forKey: "tokenData")
    }
    
    func save(data: Data?) {
        if let data = data {
            let tokenData = try? JSONDecoder().decode(TokenData.self, from: data)
            print(tokenData)
            self.tokenData = tokenData
        } else {
            print("JSON is not a Data")
        }
    }

}
