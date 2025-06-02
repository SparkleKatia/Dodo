//
//  PhotoCollectionCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 09/05/2025.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    static let reuseId = "PhotoCollectionCell"
    
    var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.applyShadow(cornerRadius: 10)
        return view
    }()
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.backgroundColor = .blue
        imageView.image = UIImage.init(named: "cucumber")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.text = "Маринованные огурчики"
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    var priceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.text = "90p"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstaint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(containerView)
        containerView.addSubview(photoImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(priceLabel)
    }
    
    func setupConstaint() {
        NSLayoutConstraint.activate([
            // containerView
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // photoImageView
            photoImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // nameLabel
            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            // priceLabel
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)

        ])
        
    }
}
