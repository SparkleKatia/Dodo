//
//  ProductImageCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 08/06/2025.
//

import UIKit

// MARK: - ProductImageCell

final class ProductImageCell: UITableViewCell {
    
    // MARK: - Static
    
    static let reuseID = "ProductImageCell"
    
    // MARK: - Subviews
    
    private lazy var detailImageView: ImageView = ImageView(type: .detail)
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupViews() {
        selectionStyle = .none
        contentView.addSubview(detailImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            detailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            detailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    // MARK: - Public
    
    func update(productImage: String){
        detailImageView.image = UIImage(named: productImage)
    }
}
