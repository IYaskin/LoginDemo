//
//  AppDelegate.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 20.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let enterVC = EnterViewController.loadFromNib()
        let navigationController = UINavigationController(rootViewController: enterVC)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        return true
    }

}

