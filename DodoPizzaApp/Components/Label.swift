//
//  Label.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 18/05/2025.
//
import UIKit

enum LabelType {
    case name
    case description
    case price
    case banner
    case cart
}

class Label: InsetLabel {
    
    init(type: LabelType, text: String = "") {
        super.init(frame: .zero)
        commonInit(type, text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(_ type: LabelType, _ text: String = "") {
        switch type {
            
        case .name:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 14)
            numberOfLines = 2
            
        case .description:
            self.text = text
            font = UIFont.systemFont(ofSize: 12)
            textColor = .lightGray
            numberOfLines = 5
            lineBreakMode = .byWordWrapping
            
        case .price:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 15)
            backgroundColor = .lightGray.withAlphaComponent(0.5)
            contentInset = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
            layer.cornerRadius = 16
            clipsToBounds = true
            
        case .cart:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 15)
            clipsToBounds = true
            
        case .banner:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 22)
            lineBreakMode = .byWordWrapping
        }
    }
}
