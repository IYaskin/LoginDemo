//
//  EnterRouter.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import UIKit

class EnterRouter {
    
    private weak var viewController: EnterViewController!
    
    init(viewController: EnterViewController) {
        self.viewController = viewController
    }
    
    func pushLoginVC() {
        let vc = LoginViewController.loadFromNib()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func pushRegistrationVC() {
        let vc = RegistrationViewController.loadFromNib()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }

}
