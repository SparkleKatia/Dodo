//
//  CategoryCollectionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 17/05/2025.
//

import UIKit

// MARK: - CategoryCollectionCell

final class CategoryCollectionCell: UICollectionViewCell {
    
    // MARK: - Static
    
    static let reuseID = "CategoryCollectionCell"
    
    // MARK: - Subviews
    
    private let categoryLabel: Label = Label(type: .price, text: "Breakfast")
    
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

extension CategoryCollectionCell {
    
    private func setupViews() {
        contentView.addSubview(categoryLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
