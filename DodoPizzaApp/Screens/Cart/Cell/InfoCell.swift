//
//  InfoCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 14/06/2025.
//

import UIKit

final class InfoCell: UITableViewCell {
    static let reuseID: String = "InfoCell"
    
    private lazy var totalProductsCount = Label(type: .info, text: "2 products")
    private lazy var totalProductsPrice = Label(type: .info, text: "48,56 zl")
    private lazy var dodoCoins = Label(type: .info, text: "Dodocoins")
    private lazy var dodoValue = Label(type: .info, text: "+2D")
    private lazy var delivery = Label(type: .info, text: "Delivery")
    private lazy var deliveryPrice = Label(type: .info, text: "4.90 zl")
    
    private lazy var productsHorizontalStackView = StackView(type: .info)
    private lazy var dodoCointsHorizontalStackView = StackView(type: .info)
    private lazy var deliveryHorizontalStackView = StackView(type: .info)
    
    private lazy var verticalStackView = StackView(type: .productCell)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
        private func setupViews() {
            productsHorizontalStackView.addArrangedSubview(totalProductsCount)
            productsHorizontalStackView.addArrangedSubview(totalProductsPrice)
            
            dodoCointsHorizontalStackView.addArrangedSubview(dodoCoins)
            dodoCointsHorizontalStackView.addArrangedSubview(dodoValue)
            
            deliveryHorizontalStackView.addArrangedSubview(delivery)
            deliveryHorizontalStackView.addArrangedSubview(deliveryPrice)
            
            verticalStackView.addArrangedSubview(productsHorizontalStackView)
            verticalStackView.addArrangedSubview(dodoCointsHorizontalStackView)
            verticalStackView.addArrangedSubview(deliveryHorizontalStackView)
            
            contentView.addSubview(verticalStackView)
            verticalStackView.alignment = .fill
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,  constant: -16),
                verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,  constant: 16),
                verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,  constant: -16),
            ])
        }
}

