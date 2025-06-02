//
//  BannerContainerCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 11/05/2025.
//

import UIKit

class BannerContainerCell: UITableViewCell {
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Выгодно и вкусно"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 220, height: 100)
                                 
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BannerCollectionCell.self, forCellWithReuseIdentifier: BannerCollectionCell.reuseID)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            //collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension BannerContainerCell: UICollectionViewDelegate {
    
}

extension BannerContainerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionCell.reuseID, for: indexPath) as? BannerCollectionCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
