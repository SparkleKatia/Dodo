//
//  BannerViewController.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 04/08/2025.
//

import UIKit

// MARK: - BannerViewController

final class BannerViewController: UIViewController {
    
    // MARK: - Private propertires
    
    private var image: String
    
    // MARK: - Subviews
    
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var closeButton: CloseChevronButton = CloseChevronButton()
    
    // MARK: - Initializers
    
    init(image: String) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupObservers()
    }
}

// MARK: - Actions (Event Handlers)

extension BannerViewController {
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    private func setupObservers() {
        closeButton.onCloseButtonTapped = {
            self.dismiss(animated: true)
        }
    }
}

// MARK: - Layout

extension BannerViewController {
    private func setupViews() {
        view.addSubview(bannerImageView)
        view.addSubview(closeButton)
        closeButton.alpha = 0.5
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: 16),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                             constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
            bannerImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

