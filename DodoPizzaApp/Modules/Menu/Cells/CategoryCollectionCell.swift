//
//  CategoryCollectionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 17/05/2025.
//

import UIKit

final class CategoryCollectionCell: UICollectionViewCell {
    
    static let reuseID = "CategoryCollectionCell"
    
    private let categoryLabel: Label = Label(type: .price, text: "Breakfast")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(categoryLabel)
    }
    
    func setupConstraints() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 6),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 6),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
        ])
    }
}
