//
//  DescriptionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 08/06/2025.
//

import UIKit

// MARK: - DescriptionCell

final class DescriptionCell: UITableViewCell {
    
    // MARK: - Static
    
    static let reuseID = "DescriptionCell"
    
    // MARK: - Subviews
    
    private lazy var productName: Label = Label(type: .name, text: "Ham and Cheese")
    private lazy var productDescription: Label = Label(type: .description, text: "30 sm, cream sauce, extra cheese, ham")
    private lazy var verticalStack: StackView = StackView(type: .productCell)

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
        verticalStack.addArrangedSubview(productName)
        verticalStack.addArrangedSubview(productDescription)
        contentView.addSubview(verticalStack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
