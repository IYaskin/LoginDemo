//
//  UIViewController+showAlert.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String,
                       message: String? = nil,
                       okButtonTitle: String,
                       okAction: ((UIAlertAction) -> Void)? = nil,
                       cancelButtonTitle: String,
                       cancelAction: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        let okAction = UIAlertAction(title: okButtonTitle,
                                     style: .default,
                                     handler: okAction)
        alert.addAction(okAction)

        let cancelAction = UIAlertAction(title: cancelButtonTitle,
                                         style: .default,
                                         handler: cancelAction)
        alert.addAction(cancelAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func showOkAlert(title: String,
                       message: String? = nil,
                       okAction: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ок",
                                         style: .default,
                                         handler: okAction)
            alert.addAction(okAction)
            self?.present(alert,
                          animated: true,
                          completion: nil)
        }
    }
    
}
