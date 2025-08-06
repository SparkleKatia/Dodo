//
//  ProfileNavBarView.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 05/08/2025.
//

import UIKit

// MARK: - ProfileNavBarVie

final class ProfileNavBarView: UIView {
    
    // MARK: - Public
    
    // TODO: Is this correct?
    var onCloseButtonTapped: (() -> Void)? {
            didSet {
                closeButton.onCloseButtonTapped = onCloseButtonTapped
            }
        }
    
    // MARK: - Subviews
    
    private lazy var closeButton = CloseChevronButton()
    
    private lazy var profileIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 22
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileImageTapped)))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupObservers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Event Handlers
    
    private func setupObservers() {
        closeButton.onCloseButtonTapped = onCloseButtonTapped
    }
    
    // MARK: - Layout
    
    private func setupViews() {
        self.addSubview(closeButton)
        self.addSubview(profileIconImageView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            closeButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            
            
            profileIconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            profileIconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            profileIconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            
            profileIconImageView.widthAnchor.constraint(equalToConstant: 44),
            profileIconImageView.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}

