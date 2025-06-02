//
//  BannerCollectionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 11/05/2025.
//
import UIKit

class BannerCollectionCell: UICollectionViewCell {
    
    static let reuseID = "BannerCollectionCell"
    
    private lazy var priceLabel: UIView = Label(type: .price, text: "600 p")

    private lazy var nameLabel: UILabel = Label(type: .name, text: "Margarita")
    
    private lazy var productImageView: UIImageView = ImageView(type: .banner)
    
    private lazy var verticalStack: UIStackView = StackView(type: .productCell)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(priceLabel)
    }
    
    private func setupConstraints() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            verticalStack.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
