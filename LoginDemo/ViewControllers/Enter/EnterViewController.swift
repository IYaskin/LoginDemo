//
//  EnterViewController.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 20.09.2021.
//

import UIKit

class EnterViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor

        registrationButton.layer.cornerRadius = registrationButton.bounds.height / 2
        registrationButton.layer.borderWidth = 1
        registrationButton.layer.borderColor = UIColor.black.cgColor

    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let vc = LoginViewController.loadFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func registrationButtonTapped(_ sender: UIButton) {
        let vc = RegistrationViewController.loadFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
}
