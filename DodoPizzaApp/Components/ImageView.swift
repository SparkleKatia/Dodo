//
//  ImageView.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 18/05/2025.
//

import UIKit

enum ImageViewType {
    case product
    case detail
    case banner
    case cart
}

class ImageView: UIImageView {
    
    init(type: ImageViewType) {
        super.init(frame: .zero)
        commonInit(type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(_ type: ImageViewType) {
        
        switch type {
        case .product:
            image = UIImage(named: "margarita")
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 130).isActive = true
            widthAnchor.constraint(equalToConstant: 130).isActive = true
            
        case .detail:
            image = UIImage(named: "margarita")
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 300).isActive = true
            widthAnchor.constraint(equalToConstant: 300).isActive = true
            
        case .banner:
            image = UIImage(named: "margarita")
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 100).isActive = true
            widthAnchor.constraint(equalToConstant: 100).isActive = true
            
        case .cart:
            image = UIImage(named: "margarita")
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 72).isActive = true
            widthAnchor.constraint(equalToConstant: 72).isActive = true
        }
    }
}
