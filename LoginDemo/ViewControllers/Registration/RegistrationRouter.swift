//
//  RegistrationRouter.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import UIKit

class RegistrationRouter {
    
    func openColorsVC() {
        DispatchQueue.main.async {
            let vc = ColorsViewController.loadFromNib()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = UINavigationController(rootViewController: vc)
        }
    }
    
}
