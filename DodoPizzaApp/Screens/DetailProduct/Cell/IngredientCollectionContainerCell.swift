//
//  IngridientCollectionContainer.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 15/06/2025.
//

import UIKit

// MARK: - IngredientCollectionContainerCell

final class IngredientCollectionContainerCell: UITableViewCell {
    
    // MARK: - Static
    
    static let reuseID = "IngridientCollectionContainerCell"
    
    // MARK: - Private properties
    
    private var ingredients = [Ingredient]()
    
    // MARK: - Sunviews
    
    private lazy var ingredientsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
    
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(IngredientCollectionCell.self, forCellWithReuseIdentifier: IngredientCollectionCell.reuseID)
        return collection
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource

extension IngredientCollectionContainerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientCollectionCell.reuseID, for: indexPath) as? IngredientCollectionCell else { return UICollectionViewCell() }
        
        let ingredient = ingredients[indexPath.row]
        cell.update(ingredient)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension IngredientCollectionContainerCell: UICollectionViewDelegate { }

// MARK: - UICollectionViewDelegateFlowLayout

extension IngredientCollectionContainerCell: UICollectionViewDelegateFlowLayout {
    
    private var itemsPerRow: CGFloat { 3 }
    private var interItemSpacing: CGFloat { 8 }
    private var sectionInsets: UIEdgeInsets {
        .init(top: 8, left: 16, bottom: 8, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let totalSpacing = sectionInsets.left
                         + sectionInsets.right
                         + interItemSpacing * (itemsPerRow - 1)

        let availableWidth = collectionView.bounds.width - totalSpacing

        let itemWidth = floor(availableWidth / itemsPerRow)

        return CGSize(width: itemWidth, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        interItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        interItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
}

// MARK: - Layout

extension IngredientCollectionContainerCell {
    
    private func setupView() {
        contentView.addSubview(ingredientsCollection)
    }

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            ingredientsCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            ingredientsCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ingredientsCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ingredientsCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}

// MARK: - Public

extension IngredientCollectionContainerCell {
    
    func update(_ ingredients: [Ingredient]) {
        self.ingredients = ingredients
        ingredientsCollection.reloadData()
        let count = Double(ingredients.count)
        let row = (count / 3).rounded(.up)
        let cellHeight = 160.0
        let offset = 8.0
        let collectionHeight = row * cellHeight + offset * (row + 1)
        ingredientsCollection.heightAnchor.constraint(equalToConstant: collectionHeight).isActive = true
    }
}
