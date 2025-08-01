//
//  UIView+applyShadow.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 18/05/2025.
//
import UIKit

extension UIView {

    func applyShadow(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.4
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .zero
    }
}
