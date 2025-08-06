//
//  IngredientCollectionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 15/06/2025.
//

import UIKit

// MARK: - IngredientCollectionCell

final class IngredientCollectionCell: UICollectionViewCell {
    
    // MARK: - Static
    
    static let reuseID = "IngredientCollectionCell"
    
    // MARK: - Subviews
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.applyShadow(cornerRadius: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var ingredientImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ham2")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var ingredientNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.text = "Ham"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    private lazy var ingredientPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.text = "100 p."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
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

extension IngredientCollectionCell {
    
    private func setupViews() {
        verticalStackView.addArrangedSubview(ingredientImageView)
        verticalStackView.addArrangedSubview(ingredientNameLabel)
        verticalStackView.addArrangedSubview(ingredientPriceLabel)
        containerView.addSubview(verticalStackView)
        contentView.addSubview(containerView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            verticalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            verticalStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            ingredientImageView.heightAnchor.constraint(equalToConstant: 80),
            ingredientImageView.widthAnchor.constraint(equalToConstant: 110),
        ])
    }
}

// MARK: - Public

extension IngredientCollectionCell {
    
    func update(_ ingredient: Ingredient) {
        ingredientImageView.image = UIImage(named: ingredient.image)
        ingredientNameLabel.text = ingredient.name
        //print(ingredient.name)
        ingredientPriceLabel.text = "\(ingredient.price)"
    }
}
