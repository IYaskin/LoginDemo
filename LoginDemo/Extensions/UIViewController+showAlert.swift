//
//  UIViewController+showAlert.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import UIKit

extension UIViewController {
    
    func showOkAlert(title: String,
                       message: String? = nil,
                       okAction: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ок",
                                     style: .default,
                                     handler: okAction)
        alert.addAction(okAction)
        DispatchQueue.main.async { [self] in
            present(alert,
                    animated: true,
                    completion: nil)
        }
    }
    
}
