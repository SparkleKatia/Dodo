//
//  Untitled.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 03/06/2025.
//

import UIKit

extension UIColor {
    static var carrot: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "DodoCarrot")!
        } else {
            return UIColor(red: 0.25, green: 0.47, blue: 0.91, alpha: 1.0)
        }
    }
}

