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
    case addonCart
}

class ImageView: UIImageView {
    
    init(type: ImageViewType) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
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
            heightAnchor.constraint(equalToConstant: 150).isActive = true
            widthAnchor.constraint(equalToConstant: 150).isActive = true
            
        case .detail:
            image = UIImage(named: "margarita")
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 300).isActive = true
            widthAnchor.constraint(equalToConstant: 300).isActive = true
            
        case .banner:
            image = UIImage(named: "banner1")
            contentMode = .scaleToFill

            
        case .cart:
            image = UIImage(named: "margarita")
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 72).isActive = true
            widthAnchor.constraint(equalToConstant: 72).isActive = true
        case .addonCart:
            image = UIImage(named: "roll_pineapple_padding")
            contentMode = .scaleAspectFit
            heightAnchor.constraint(equalToConstant: 120).isActive = true
            widthAnchor.constraint(equalToConstant: 120).isActive = true
        }
    }
}
