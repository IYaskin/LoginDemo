//
//  ColorsRouter.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 23.09.2021.
//

import Foundation

class ColorsRouter {
    
    private weak var viewController: ColorsViewController!
    
    init(viewController: ColorsViewController) {
        self.viewController = viewController
    }
    
    func pushAccountVC() {
        let vc = AccountViewController.loadFromNib()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
}
