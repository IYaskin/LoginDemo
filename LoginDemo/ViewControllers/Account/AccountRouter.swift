//
//  AccountRouter.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 23.09.2021.
//

import UIKit

class AccountRouter {
    
    func openEnterVC() {
            let vc = EnterViewController.loadFromNib()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = UINavigationController(rootViewController: vc)
    }
    
}
