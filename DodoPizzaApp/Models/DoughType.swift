//
//  DoughType.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 15/06/2025.
//

enum DoughType: Int, CaseIterable {
    case traditional, thin

    var title: String {
        switch self {
        case .traditional: return "Традиционное"
        case .thin: return "Тонкое"
        }
    }
}
