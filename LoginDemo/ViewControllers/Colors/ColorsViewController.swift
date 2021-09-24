//
//  ColorsViewController.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import UIKit

class ColorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var viewModel = ColorsViewModel()
    private lazy var router = ColorsRouter(viewController: self)
    
    private var colors: [Colors] = []

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
        
        tableView.dataSource = self
        tableView.delegate = self
        getColors()
    }
    
    @objc func accountButtonTapped() {
        router.pushAccountVC()
    }
    
    @objc func updateColorsButtonTapped() {
        getColors()
    }

    
    private func getColors() {
        viewModel.getColors { [weak self] colors in
            self?.colors = colors
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        } failure: { error in
            print(error.localizedDescription)
        }
    }
    
}

extension ColorsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors[section].possibleColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let color = colors[indexPath.section].possibleColors[indexPath.row]
        cell.textLabel?.text = color.color + " - \(color.hexValues.count) hex"
        return cell
    }
    
    
}


extension ColorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        colors[section].type
    }
}
