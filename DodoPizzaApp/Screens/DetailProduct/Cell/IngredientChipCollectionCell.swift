//
//  IngredientChipCollectionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 15/06/2025.
//
import UIKit

// MARK: - IngredientChipCollectionCell

final class IngredientChipCollectionCell: UICollectionViewCell {
    
    // MARK: - Static
    
    static let reuseID = "IngredientChipCollectionCell"
    
    // MARK: - Public
    
    var onRemove: (() -> Void)?
    
    // MARK: - Subviews
    
    private lazy var ingredientNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 12, weight: .regular, scale: .medium)
        let xmark = UIImage(systemName: "xmark", withConfiguration: symbolConfig)

        button.setImage(xmark, for: .normal)
        button.tintColor = .secondaryLabel
        button.addTarget(self, action: #selector(removeTapped), for: .touchUpInside)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10        
        button.layer.masksToBounds = true
        return button
    }()
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ingredientNameLabel, closeButton])
        stack.spacing = 4
        stack.alignment = .center
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 4, left: 10, bottom: 4, right: 6)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
    
    // MARK: - Action (Event Listiner)

    @objc private func removeTapped() { onRemove?() }
}

// MARK: - Public

extension IngredientChipCollectionCell {
    
    func configure(with ingredient: Ingredient) {
        ingredientNameLabel.text = ingredient.name
    }
}

// MARK: - Layout

extension IngredientChipCollectionCell {
    
    private func setupViews() {
        contentView.addSubview(horizontalStack)
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 14
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}


