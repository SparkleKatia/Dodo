//
//  product.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 08/05/2025.
//
import UIKit

struct Product: Decodable, Identifiable {
    let id: String
    let name: String
    let detail: String
    let price: Double
    let image: String
    let type: String
}
