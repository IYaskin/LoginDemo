//
//  LoginViewController.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 20.09.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private lazy var viewModel = LoginViewModel()
    private lazy var router = LoginRouter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Вход"
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func showLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.loginButton.isHidden = true
            self?.activityIndicator.startAnimating()
        }
    }
    
    private func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.loginButton.isHidden = false
            self?.activityIndicator.stopAnimating()
        }
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let error = viewModel.validateEmailAndPassword(email: emailTextField.text,
                                                       password: passwordTextField.text)
        if let error = error {
            showOkAlert(title: error.localizedDescription)
            return
        }
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        showLoader()
        viewModel.login(email: email,
                        password: password) { [weak self] in
            self?.router.openColorsVC()
        } failure: { [weak self] error in
            self?.hideLoader()
            self?.showOkAlert(title: error.localizedDescription)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
