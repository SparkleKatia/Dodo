//
//  ProfileVC.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 05/08/2025.
//

import UIKit

// MARK: - ProfileVC

final class ProfileVC: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var navigationBarView = ProfileNavBarView()
    private lazy var dodoCoinContainer: UIView = {
        let containerView = UIView()
        
        containerView.backgroundColor = .systemBackground
        containerView.applyShadow(cornerRadius: 12)
        containerView.layer.cornerRadius = 12
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    private lazy var dodoCoinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dodoCoin")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupObservers()
    }
    
    // MARK: - Layout
    
    private func setupViews() {
        view.backgroundColor = .systemGray6
        dodoCoinContainer.addSubview(dodoCoinImageView)
        view.addSubview(navigationBarView)
        view.addSubview(dodoCoinContainer)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            dodoCoinContainer.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 16),
            dodoCoinContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dodoCoinContainer.widthAnchor.constraint(equalToConstant: 200),
            
            dodoCoinImageView.topAnchor.constraint(equalTo: dodoCoinContainer.topAnchor, constant: 6),
            dodoCoinImageView.leadingAnchor.constraint(equalTo: dodoCoinContainer.leadingAnchor, constant: 6),
            dodoCoinImageView.bottomAnchor.constraint(equalTo: dodoCoinContainer.bottomAnchor, constant: -6),
            
            dodoCoinImageView.widthAnchor.constraint(equalToConstant: 80),
            dodoCoinContainer.heightAnchor.constraint(equalToConstant: 120)
            
        ])
    }
    // MARK: - Event Handlers
    
    private func setupObservers() {
        navigationBarView.onCloseButtonTapped = {
            [weak self] in self?.dismiss(animated: true)
        }
    }
}
