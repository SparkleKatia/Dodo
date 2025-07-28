//
//  PizzaSize.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 15/06/2025.
//

import UIKit

enum PizzaSize: Int, CaseIterable {
    case small25, medium30, large35

    var title: String {
        switch self {
        case .small25:  return "25 см"
        case .medium30: return "30 см"
        case .large35:  return "35 см"
        }
    }
}
