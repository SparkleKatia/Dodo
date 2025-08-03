//
//  BannerCollectionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 11/05/2025.
//
import UIKit

// MARK: - BannerCollectionCell

class BannerCollectionCell: UICollectionViewCell {
    
    // MARK: - Static
    
    static let reuseID = "BannerCollectionCell"
    
    // MARK: - Subviews
    
    private lazy var productImageView: ImageView = ImageView(type: .banner)
    private lazy var containerView: UIView = UIView()
    
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

extension BannerCollectionCell {
    
    private func setupViews() {
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.addSubview(productImageView)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
        ])
    }
}

// MARK: - Public

extension BannerCollectionCell {
    
    func configure(with banner: Banner) {
        productImageView.image = UIImage(named: banner.image)
    }
}
