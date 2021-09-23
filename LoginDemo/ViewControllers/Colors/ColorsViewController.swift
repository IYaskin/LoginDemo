//
//  ColorsViewController.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import UIKit

class ColorsViewController: UIViewController {
    
    private lazy var router = ColorsRouter(viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if let tokenData = AccountSettings.shared.tokenData {
            print("token: \(tokenData.token ?? "nil\n\n")")
            print("tokenTtl: \(tokenData.tokenTtl ?? "nil\n\n")")
            print("tokenExpiredAt: \(tokenData.tokenExpiredAt ?? "nil\n\n")")
            print("refreshToken: \(tokenData.refreshToken ?? "nil\n\n")")
            print("refreshTokenTtl: \(tokenData.refreshTokenTtl ?? "nil\n\n")")
            print("refreshTokenExpiredAt: \(tokenData.refreshTokenExpiredAt ?? "nil\n\n")")
            print("email: \(tokenData.user?.email ?? "nil\n\n")")
        } else {
            print("No token Data")
        }
        
    }
    
    private func setupUI() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        let accountButton = UIBarButtonItem(title: "Аккаунт",
                                            style: .plain,
                                            target: self,
                                            action: #selector(accountButtonTapped))
        self.navigationItem.rightBarButtonItem = accountButton
    }
    
    @objc func accountButtonTapped() {
        router.pushAccountVC()
    }
}
