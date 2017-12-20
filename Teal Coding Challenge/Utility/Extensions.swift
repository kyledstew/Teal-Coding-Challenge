//
//  Extensions.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import UIKit

extension UIButton {
    
    func applyDefaultButtonAppearance() {
        self.backgroundColor = UIColor.red
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 15
        self.addShadow(color: .black)
    }
    
}

extension UIView {
    func addShadow(color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 3
    }
}
