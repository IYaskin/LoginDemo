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
//        let vc = ColorsViewController.loadFromNib()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = vc
        NetworkManager.shared.postRequest(path: .register,
                                          params: ["email": "igor@mail.ru",
                                                   "password": "123456"]) { json in
            print("JSON")
            print(json)
        } failure: { error in
            print(error)
        }

    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
