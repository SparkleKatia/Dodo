//
//  StackView.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 18/05/2025.
//

import UIKit

enum StackViewType {
    case productCell
}

class StackView: UIStackView {
    
    init(type: StackViewType) {
        super.init(frame: .zero)
        
        commonInit(type)
    }
    
    func commonInit(_ type: StackViewType) {
        
        switch type {
        case .productCell:
            axis = .vertical
            spacing = Layout.offset6
            distribution = .fill
            alignment = .leading
            
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
            isLayoutMarginsRelativeArrangement = true
            backgroundColor = .systemBackground
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
