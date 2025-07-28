//
//  Ingridient.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 15/06/2025.
//

import UIKit

struct Ingredient: Hashable {
    let id = UUID()
    let name: String
    let image: String
    let price: Double
}
