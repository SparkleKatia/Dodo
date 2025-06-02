//
//  AdressCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 01/06/2025.
//

import UIKit

class AdressCell: UITableViewCell {
    
    static let reuseID = "AdressCell"
    
    private lazy var deliveryIconImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "delivery-man")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(
            red:   235.0 / 255.0,
            green: 113.0 / 255.0,
            blue:   50.0 / 255.0,
            alpha:  1.0
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let streetLabel = Label(type: .cart)
    private let arrowButton: UIButton = {
        var button = UIButton()
        
        let cfg    = UIImage.SymbolConfiguration(pointSize: 14, weight: .semibold)
        button.setImage(UIImage(systemName: "chevron.forward",
                               withConfiguration: cfg),
                       for: .normal)

        button.tintColor = .systemGray // your orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(deliveryIconImageView)
        streetLabel.text = "Grzybowska,49D"
        contentView.addSubview(streetLabel)
        contentView.addSubview(arrowButton)
    }
    
    func setupConstraints() {
        streetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deliveryIconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            deliveryIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            streetLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            streetLabel.leadingAnchor.constraint(equalTo: deliveryIconImageView.trailingAnchor, constant: 8),
            
            deliveryIconImageView.widthAnchor.constraint(equalToConstant: 18),
            deliveryIconImageView.heightAnchor.constraint(equalToConstant: 18),
            
            arrowButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16) // ← −16
        ])
    }
    
}
