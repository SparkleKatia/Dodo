//
//  CartButtonView.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 18/07/2025.
//

import UIKit

// MARK: - CartButton

final class CartButton: UIButton {
    
    // MARK: - Public
    
    var onCartButtonTapped: (()->())?
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let attributeContainer = setupAttributeContainer()
        let configuration = setupConfiguration(container: attributeContainer)
        self.configuration = configuration
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(nil, action: #selector(cartButtonTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupAttributeContainer() -> AttributeContainer {
        var container = AttributeContainer()
        container.font = .boldSystemFont(ofSize: 15)
        return container
    }
    
    private func setupConfiguration(container: AttributeContainer) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = AttributedString("3 000 p", attributes: container)
        let symbolCfg = UIImage.SymbolConfiguration(pointSize: 12, weight: .bold)
        configuration.image = UIImage(systemName: "basket")?
            .withConfiguration(symbolCfg)
            .withRenderingMode(.alwaysTemplate)
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = UIColor.carrot
        configuration.baseForegroundColor = .systemBackground
        configuration.image?.withTintColor(.systemBackground)
        configuration.imagePadding = 6
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        return configuration
    }
    
    // MARK: - Actions (Event handlers)
    
    @objc
    func cartButtonTap() {
        onCartButtonTapped?()
    }
}

