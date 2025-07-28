//
//  PromoCodeCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 13/06/2025.
//

import UIKit

// MARK: - PromoCodeCell

final class PromoCodeCell: UITableViewCell {
    
    // MARK: - Static
    
    static let reuseID = "PromoCodeCell"
    
    // MARK: - Subviews
    
    private lazy var promoButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = .boldSystemFont(ofSize: 15)
        configuration.attributedTitle = AttributedString("Use promocode", attributes: container)
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = .systemGray6
        configuration.baseForegroundColor = .black
        configuration.image?.withTintColor(.systemBackground)
        configuration.imagePadding = 6
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    // MARK: - Layout
    
    private func setupViews() {
        contentView.addSubview(promoButton)
    }
    
    private func setupConstraints() {
        promoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            promoButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            promoButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            promoButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            promoButton.heightAnchor.constraint(equalToConstant: 42),
            promoButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
