//
//  ProductCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 27/04/2025.
//

import UIKit

class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    
    private var containerView: UIView = {
        $0.backgroundColor = .white
        $0.applyShadow(cornerRadius: 10)
        return $0
    }(UIView())
    
    var verticlStackView: UIStackView = StackView(type: .productCell)
    
    var nameLabel: UILabel = Label(type: .name, text: "")
    
    var detailLabel: UILabel = Label(type: .description, text: "")
    
    var priceLabel: Label = Label(type: .price, text: "ot 200 p")
    
    var productImageView: UIImageView = ImageView(type: .product)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: Product) {
        nameLabel.text = product.name
        detailLabel.text = product.detail
        productImageView.image = UIImage(named: product.image)
        
    }
    
}

extension ProductCell {
    private func setupConstraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        verticlStackView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        verticlStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // containerView
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // productImageView
            productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            productImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            productImageView.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor, constant: 8),
            productImageView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -8),

            // verticalStackView
            verticlStackView.topAnchor
                    .constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                constant: Layout.offset16),
            verticlStackView.bottomAnchor
                    .constraint(greaterThanOrEqualTo: contentView.bottomAnchor,
                                constant: -Layout.offset16),
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
