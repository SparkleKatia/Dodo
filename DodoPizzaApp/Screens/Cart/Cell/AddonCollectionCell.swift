//
//  AddonCollectionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 07/06/2025.
//

import UIKit

// MARK: - AddonCollectionCell

final class AddonCollectionCell: UICollectionViewCell {
    
    // MARK: - Static
    
    static let reuseID = "AddonCollectionCell"
    
    // MARK: - Subviews
    
    private var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.09).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 10)
        view.layer.shadowRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var productName: Label = Label(type: .name, text: "Rolls Pineapple & Cinamon")
    private var productDescription: Label = Label(type: .description, text: "16 pc")
    private var verticalStackView: StackView = StackView(type: .productCell)
    private var addonImage: ImageView = ImageView(type: .addonCart)
    private var addonButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = .boldSystemFont(ofSize: 12)
        configuration.attributedTitle = AttributedString("10,33 zl", attributes: container)
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = .systemGray6
        configuration.baseForegroundColor = .black
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupViews() {
        contentView.addSubview(containerView)
        contentView.addSubview(addonImage)
        verticalStackView.addArrangedSubview(productName)
        verticalStackView.addArrangedSubview(productDescription)
        containerView.addSubview(verticalStackView)
        containerView.addSubview(addonButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 52),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            addonImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            addonImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: addonImage.bottomAnchor, constant: -16),
            verticalStackView.bottomAnchor.constraint(equalTo: addonButton.topAnchor, constant: -28),
            verticalStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            addonButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            addonButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            addonButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
        ])
    }
}
