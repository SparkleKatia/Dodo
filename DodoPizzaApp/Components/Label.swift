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
    case info
    case bannerName
}

class Label: InsetLabel {
    
    init(type: LabelType, text: String = "") {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
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
            lineBreakMode = .byWordWrapping
            numberOfLines = 3
            
        case .description:
            self.text = text
            font = UIFont.systemFont(ofSize: 12)
            textColor = .lightGray
            numberOfLines = 5
            lineBreakMode = .byWordWrapping
            
        case .price:
            self.text = text
            font = .systemFont(ofSize: 12, weight: .medium)
            backgroundColor = .systemGray6
            //textAlignment = .center 
            contentInset = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
            layer.cornerRadius = 14
            clipsToBounds = true
            
        case .cart:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 15)
            clipsToBounds = true
            
        case .banner:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 22)
            lineBreakMode = .byWordWrapping
            
        case .info:
            self.text = text
            font = UIFont.systemFont(ofSize: 13)
            lineBreakMode = .byWordWrapping
            numberOfLines = 3
        case .bannerName:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 22)
            lineBreakMode = .byWordWrapping
        }
        
    }
}
