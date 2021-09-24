//
//  ColorsViewController.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import UIKit

class ColorsViewController: UIViewController {
    
    private lazy var viewModel = ColorsViewModel()
    private lazy var router = ColorsRouter(viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        let updateColorsButton = UIBarButtonItem(title: "Обновить",
                                            style: .plain,
                                            target: self,
                                            action: #selector(updateColorsButtonTapped))
        self.navigationItem.leftBarButtonItem = updateColorsButton

        let accountButton = UIBarButtonItem(title: "Аккаунт",
                                            style: .plain,
                                            target: self,
                                            action: #selector(accountButtonTapped))
        self.navigationItem.rightBarButtonItem = accountButton
    }
    
    @objc func accountButtonTapped() {
        router.pushAccountVC()
    }
    
    @objc func updateColorsButtonTapped() {
        getColors()
    }

    
    private func getColors() {
        viewModel.getColors {
            print("SUCCESS")
        } failure: { error in
            print(error.localizedDescription)
        }

    }
}
