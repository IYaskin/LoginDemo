//
//  RegistrationViewController.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 20.09.2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private lazy var viewModel = RegistrationViewModel()
    private lazy var router = RegistrationRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Регистрация"
        registrationButton.layer.cornerRadius = registrationButton.bounds.height / 2
        registrationButton.layer.borderWidth = 1
        registrationButton.layer.borderColor = UIColor.black.cgColor
        
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

    @IBAction func registrationButtonTapped(_ sender: UIButton) {
        register()
    }
    
    private func showLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.registrationButton.isHidden = true
            self?.activityIndicator.startAnimating()
        }
    }
    
    private func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.registrationButton.isHidden = false
            self?.activityIndicator.stopAnimating()
        }
    }
    
    private func register() {
        let error = viewModel.validateEmailAndPassword(email: emailTextField.text,
                                                       password: passwordTextField.text)
        if let error = error {
            showOkAlert(title: error.localizedDescription)
            return
        }
         
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        showLoader()
        viewModel.register(email: email,
                           password: password) { [weak self] _ in
            self?.login(email: email, password: password)
        } failure: { [weak self] error in
            self?.hideLoader()
            self?.showOkAlert(title: error.localizedDescription)
        }
    }
    
    private func login(email: String,
                       password: String) {
        viewModel.login(email: email,
                        password: password) { [weak self] in
            self?.router.openColorsVC()
        } failure: { [weak self] error in
            self?.hideLoader()
            self?.showOkAlert(title: error.localizedDescription)
        }

    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
