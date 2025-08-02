//
//  IngridientChipContainer.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 15/06/2025.
//

import UIKit

// MARK: - IngredientChipContainer

final class IngredientChipContainer: UITableViewCell {
    
    // MARK: - Static
    
    static let reuseID = "IngridientChipContainer"
    
    // MARK: - Private
    
    var ingredients: [Ingredient] = []
    
    // MARK: - Public
    
    var onRemove: ((Ingredient) -> Void)?
    
    // MARK: - Subviews
    
    private lazy var ingridientsChipcollection: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .blue
        collection.dataSource = self
        collection.delegate   = self
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(IngredientChipCollectionCell.self, forCellWithReuseIdentifier: "IngredientChipCollectionCell")
        return collection
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstrains()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        ingridientsChipcollection.layoutIfNeeded()
        let size = ingridientsChipcollection.collectionViewLayout.collectionViewContentSize
        return CGSize(width: targetSize.width, height: size.height + 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UICollectionViewDataSource

extension IngredientChipContainer: UICollectionViewDataSource {
    
    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int { ingredients.count }

    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let chip = cv.dequeueReusableCell(withReuseIdentifier: "IngredientChipCollectionCell", for: indexPath) as! IngredientChipCollectionCell
        let ingredient = ingredients[indexPath.item]
        chip.configure(with: ingredient)
        chip.onRemove = { [weak self] in self?.onRemove?(ingredient) }
        return chip
    }
}

// MARK: - IngredientChipContainer

extension IngredientChipContainer: UICollectionViewDelegate { }

// MARK: - Public

extension IngredientChipContainer {
    
    func update(_ ingredients: [Ingredient]) {
        self.ingredients = ingredients
        ingridientsChipcollection.reloadData()
    }
}

// MARK: - Layout

extension IngredientChipContainer {
    
    private func setupViews() {
        contentView.addSubview(ingridientsChipcollection)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            ingridientsChipcollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            ingridientsChipcollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ingridientsChipcollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ingridientsChipcollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            ingridientsChipcollection.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
