//
//  NavigationHeader 2.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 13/06/2025.
//


import UIKit

// MARK: - NavigationBarView

final class NavigationBarView: UIView {

    // MARK: - Static
    
    static let reuseID = "NavigationHeader"
    
    // MARK: - Public
    
    var onCloseButtonTapped: (()->())?
    var onDeleteButtonTapped: (()->())?
    
    // MARK: - Sunviews
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .label
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var closeButton: UIButton = {
        var button = UIButton()
        button.setTitle("Close", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.carrot, for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var deleteButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        let symbolCfg = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        configuration.image = UIImage(systemName: "trash")?
            .withConfiguration(symbolCfg)
            .withRenderingMode(.alwaysTemplate)
        configuration.baseForegroundColor = .systemBackground
        configuration.baseForegroundColor = UIColor.carrot
        configuration.baseBackgroundColor = .systemBackground
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(deleteButtonTapped), for: .touchUpInside)
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
}

// MARK: - Public

extension NavigationBarView {
    
    func setTitle(_ text: String?, visible: Bool, animated: Bool = true) {
        titleLabel.text = text
        let newAlpha: CGFloat = visible ? 1 : 0
        guard animated else { titleLabel.alpha = newAlpha; return }
        UIView.animate(withDuration: 0.05) { self.titleLabel.alpha = newAlpha }
    }
}

// MARK: - Layout

extension NavigationBarView {
    
    private func setupViews() {
        addSubview(closeButton)
        addSubview(deleteButton)
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
            
            deleteButton.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

// MARK: - Actions (Event Handlers)

extension NavigationBarView {
    
    @objc private func closeButtonTapped() {
        onCloseButtonTapped?()
    }
    
    @objc private func deleteButtonTapped() {
        onDeleteButtonTapped?()
    }
}
