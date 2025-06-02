//
//  CartProductCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 01/06/2025.
//

import UIKit

class CartProductCell: UITableViewCell {
    
    var productImageView = ImageView(type: .cart)
    var verticalStackView = StackView(type: .productCell)
    var productNameLabel = Label(type: .name)
    var descriptionLabel = Label(type: .description)
    var stepper = CustomStepper()
    var priceLabel = Label(type: .cart)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(stepper)
        contentView.addSubview(priceLabel)
        verticalStackView.addArrangedSubview(productNameLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupConstraint() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            verticalStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalStackView.centerYAnchor.constraint(equalTo: productImageView.centerYAnchor),

            priceLabel.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 32),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            stepper.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            stepper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stepper.widthAnchor.constraint(equalToConstant: 90),
            stepper.heightAnchor.constraint(equalToConstant: 25),
])
    }
    
    func update() {
        productNameLabel.text = "Margarita Classic"
        descriptionLabel.text = "30 cm, traditional"
        priceLabel.text = "100,99 zl"
    }
}
