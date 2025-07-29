//
//  ProductCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 27/04/2025.
//

import UIKit

// MARK: - ProductCell

final class ProductCell: UITableViewCell {
    
    // MARK: - Static
    
    static let reuseId = "ProductCell"
    
    // MARK: - Subviews
    
    private var containerView: UIView = {
        $0.backgroundColor = .white
        $0.applyShadow(cornerRadius: 10)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private var verticlStackView: StackView = StackView(type: .productCell)
    private var nameLabel: Label = Label(type: .name, text: "")
    private var detailLabel: Label = Label(type: .description, text: "")
    private var priceLabel: Label = Label(type: .price, text: "ot 200 p")
    private var productImageView: ImageView = ImageView(type: .product)
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func update(_ product: Product) {
        nameLabel.text = product.name
        detailLabel.text = product.detail
        productImageView.image = UIImage(named: product.image)
        
    }
}

// MARK: - Layout

extension ProductCell {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Layout.offset16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Layout.offset16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Layout.offset8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Layout.offset8),
            
            productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Layout.offset8),
            productImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            productImageView.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor, constant: Layout.offset8),
            productImageView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -Layout.offset8),

            verticlStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            verticlStackView.leadingAnchor
                   .constraint(equalTo: productImageView.trailingAnchor,
                               constant: Layout.offset8),
            verticlStackView.trailingAnchor
                   .constraint(equalTo: contentView.trailingAnchor,
                               constant: -Layout.offset16)
        ])
    }
    
    private func setupViews() {
        selectionStyle = .none
        backgroundColor = .systemBackground
        [containerView].forEach {
            contentView.addSubview($0)
        }
        [productImageView, verticlStackView].forEach {
            containerView.addSubview($0)
        }
        [nameLabel, detailLabel, priceLabel].forEach {
            verticlStackView.addArrangedSubview($0)
        }
    }
}
