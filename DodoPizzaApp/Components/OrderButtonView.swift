//
//  OrderButtonView.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 01/06/2025.
//

import UIKit

// MARK: - OrderButtonView

class OrderButtonView: UIView {
    
    // MARK: - Public API
    
    var onOrderButtonTapped: (()->())?
    
    // MARK: - Subviews
    
    private lazy var orderButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = .boldSystemFont(ofSize: 15)
        configuration.attributedTitle = AttributedString("Make an order with 40 zl", attributes: container)
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = UIColor.carrot
        configuration.baseForegroundColor = .systemBackground
        configuration.image?.withTintColor(.systemBackground)
        configuration.imagePadding = 6
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(orderButtonTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupViews() {
        addSubview(orderButton)
    }
    
    func setupConstraint() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            orderButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            orderButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            orderButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            orderButton.heightAnchor.constraint(equalToConstant: 42)
            
        ])
    }
    
    // MARK: - Actions
    @objc
    func orderButtonTap() {
        onOrderButtonTapped?()
    }
}
