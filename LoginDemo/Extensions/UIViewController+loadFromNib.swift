//
//  UIViewController+loadFromNib.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 20.09.2021.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        return Self.init(nibName: String(describing: Self.self), bundle: nil)
    }
}
