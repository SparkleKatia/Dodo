//
//  UITableViewCell+removeSeparator.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 01/08/2025.
//

import UIKit

extension UITableViewCell {
    
    func removeSeparator() {
        separatorInset = UIEdgeInsets(top: 0,
                                      left: .greatestFiniteMagnitude,
                                      bottom: 0,
                                      right: 0)
    }
}
