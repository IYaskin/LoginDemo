//
//  ColorsViewModel.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 23.09.2021.
//

import Foundation

class ColorsViewModel {
    private let networkManager = NetworkManager()
    
    func getColors(success: @escaping ([Colors]) -> Void,
                   failure: @escaping ErrorHandler) {
        
        networkManager.getColors(success: { data in
            if let data = data,
               let colors = try? JSONDecoder().decode(Array<Colors>.self, from: data) {
                print(colors)
                success(colors)
            } else {
                print("Bad parsing Colors")
                failure(NetworkError.parseError)
            }

        },
        failure: failure)
    }
    
}
