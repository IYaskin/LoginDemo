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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        logoutButton.layer.cornerRadius = logoutButton.bounds.height / 2
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.borderColor = UIColor.red.cgColor

        if let tokenData = AccountSettings.shared.tokenData {
            emailLabel.text = "email: \(tokenData.user?.email ?? "nil")"
            
            tokenLabel.text = "token: \(tokenData.token ?? "nil")"
            tokenTtlLabel.text = "tokenTTL: \(tokenData.tokenTtl ?? "nil")"
            tokenExpiredAtLabel.text = "tokenExpiredAt: \(tokenData.tokenExpiredAt ?? "nil")"

            refreshTokenLabel.text = "refreshToken: \(tokenData.token ?? "nil")"
            refreshTokenTtlLabel.text = "refreshTokenTTL: \(tokenData.tokenTtl ?? "nil")"
            refreshTokenExpiredAtLabel.text = "refreshTokenExpiredAt: \(tokenData.tokenExpiredAt ?? "nil")"
        } else {
            print("No token Data")
        }
    }

    @IBAction func logoutButton(_ sender: UIButton) {
        
    }
}
