//
//  BannerCollectionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 11/05/2025.
//
import UIKit

// MARK: - BannerCollectionCell

class BannerCollectionCell: UICollectionViewCell {
    
    // MARK: - Static
    
    static let reuseID = "BannerCollectionCell"
    
    // MARK: - Subviews
    
    private lazy var priceLabel: UIView = Label(type: .price, text: "600 p")
    private lazy var nameLabel: UILabel = Label(type: .name, text: "Margarita")
    private lazy var productImageView: UIImageView = ImageView(type: .banner)
    private lazy var verticalStack: UIStackView = StackView(type: .productCell)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension BannerCollectionCell {
    
    private func setupViews() {
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(priceLabel)
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            verticalStack.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            verticalStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
