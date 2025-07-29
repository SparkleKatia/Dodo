//
//  AddonContainerCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 06/06/2025.
//
import UIKit

// MARK: - AddonContainerCell

final class AddonContainerCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private lazy var addonCollection: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 250)
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(AddonCollectionCell.self, forCellWithReuseIdentifier: AddonCollectionCell.reuseID)
        return collection
    }()
    private lazy var titleLable: UILabel = {
        var label = UILabel()
        label.text = "Add to the order?"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupView() {
        contentView.addSubview(addonCollection)
        contentView.addSubview(titleLable)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addonCollection.topAnchor.constraint(equalTo: titleLable.bottomAnchor),
            addonCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            addonCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            addonCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            addonCollection.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}

// MARK: - UICollectionViewDelegate

extension AddonContainerCell: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension AddonContainerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddonCollectionCell.reuseID, for: indexPath) as! AddonCollectionCell
        return cell
    }
}
