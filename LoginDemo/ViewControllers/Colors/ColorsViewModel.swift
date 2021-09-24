//
//  ColorsViewModel.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 23.09.2021.
//

import Foundation

class ColorsViewModel {
    private let networkManager = NetworkManager()
    
    func getColors(success: @escaping () -> Void,
                   failure: @escaping ErrorHandler) {
        
        networkManager.getColors(success: { data in
            if let data = data {
                do {
                    let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
                    print(responseJSON)
                }
                catch {
                    print("Failure")
                }
            }
            success()
        },
        failure: failure)
    }
    
}
