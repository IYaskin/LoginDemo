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
    
    private lazy var router = EnterRouter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setupUI() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor

        registrationButton.layer.cornerRadius = registrationButton.bounds.height / 2
        registrationButton.layer.borderWidth = 1
        registrationButton.layer.borderColor = UIColor.black.cgColor

    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        router.pushLoginVC()
    }
    
    
    @IBAction func registrationButtonTapped(_ sender: UIButton) {
        router.pushRegistrationVC()
    }
}
