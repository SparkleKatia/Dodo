//
//  CategoryContainerHeader.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 17/05/2025.
//
import UIKit

// MARK: - CategoryContainerHeader

final class CategoryContainerHeader: UITableViewHeaderFooterView {
    
    // MARK: - Static
    
    static let reuseID = "CategoryContainerHeader"
    
    // MARK: - Private
    
    private var categories: [ICategory] = []

    // MARK: - Subviews
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 3
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.reuseID)
        collectionView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        return collectionView
    }()
    
    // MARK: - Initializers
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension CategoryContainerHeader {
    
    private func setupViews() {
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension CategoryContainerHeader: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.reuseID, for: indexPath) as! CategoryCollectionCell
        cell.configure(with: categories[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CategoryContainerHeader: UICollectionViewDelegate { }


// MARK: - Public

extension CategoryContainerHeader {
    
    func update(categories: [ICategory]) {
        self.categories = categories
        collectionView.reloadData()
        print(self.categories)
    }
}
