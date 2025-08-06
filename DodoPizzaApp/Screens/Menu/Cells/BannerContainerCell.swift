//
//  BannerContainerCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 11/05/2025.
//

import UIKit

// MARK: - BannerContainerCell

class BannerContainerCell: UITableViewCell {
    
    // MARK: - Public
    
    var onBannerSelected: ((Banner) -> Void)?
    
    // MARK: - Private
    
    private var banners: [Banner] = []
    
    // MARK: - Subviews
    
   // private lazy var nameLabel: Label = Label(type: .bannerName, text: "Выгодно и вкусно")
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 90, height: 110)
                                 
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BannerCollectionCell.self, forCellWithReuseIdentifier: BannerCollectionCell.reuseID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        return collectionView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension BannerContainerCell {
    
    private func setupViews() {
       // contentView.addSubview(nameLabel)
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
//            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension BannerContainerCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionCell.reuseID, for: indexPath) as? BannerCollectionCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: banners[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension BannerContainerCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let banner = banners[indexPath.item]
        onBannerSelected?(banner)
    }
    
    // TODO: Is that corect?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        onBannerSelected = nil                 // avoid accidental retain cycles
    }
}


// MARK: - Public

extension BannerContainerCell {
    
    func update(banners: [Banner]) {
        self.banners = banners
        collectionView.reloadData()
    }
}
