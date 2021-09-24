//
//  AccountViewController.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 23.09.2021.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var tokenTtlLabel: UILabel!
    @IBOutlet weak var tokenExpiredAtLabel: UILabel!
    
    @IBOutlet weak var refreshTokenLabel: UILabel!
    @IBOutlet weak var refreshTokenTtlLabel: UILabel!
    @IBOutlet weak var refreshTokenExpiredAtLabel: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    private lazy var router = AccountRouter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Аккаунт"
        logoutButton.layer.cornerRadius = logoutButton.bounds.height / 2
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.borderColor = UIColor.red.cgColor

        if let tokenData = AccountSettings.shared.tokenData {
            emailLabel.text = "email: \(tokenData.user?.email ?? "nil")"
            
            tokenLabel.text = "token: \(tokenData.token ?? "nil")"
            tokenTtlLabel.text = "tokenTTL: \(tokenData.tokenTtl ?? "nil")"
            tokenExpiredAtLabel.text = "tokenExpiredAt: \(tokenData.tokenExpiredAt ?? "nil")"

            refreshTokenLabel.text = "refreshToken: \(tokenData.refreshToken ?? "nil")"
            refreshTokenTtlLabel.text = "refreshTokenTTL: \(tokenData.refreshTokenTtl ?? "nil")"
            refreshTokenExpiredAtLabel.text = "refreshTokenExpiredAt: \(tokenData.refreshTokenExpiredAt ?? "nil")"
            
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

    @IBAction func logoutButton(_ sender: UIButton) {
        showAlert(title: "Выйти из аккаунта?",
                  okButtonTitle: "Ок",
                  okAction: { [weak self] _ in
                    self?.logout()
                  },
                  cancelButtonTitle: "Отмена")
    }
    
    private func logout() {
        DispatchQueue.main.async { [weak self] in
            AccountSettings.shared.deleteAccount()
            self?.router.openEnterVC()
        }
    }
}
