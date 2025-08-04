//
//  CloseChevronButton.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 04/08/2025.
//

import UIKit

// MARK: - CloseChevronButton

final class CloseChevronButton: UIButton {
    
    // MARK: - Public
    
    var onCloseButtonTapped: (()->())?
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupView() {
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        setImage(UIImage(systemName: "chevron.down",withConfiguration: sizeConfig), for: .normal)
        tintColor = .label
        backgroundColor = .systemBackground
        layer.cornerRadius = 22
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowRadius  = 4
        layer.shadowOffset  = .zero
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(closeButtonTapped),for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 44),
            heightAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    // MARK: - Actions (Event handlers)
    
    @objc
    func closeButtonTapped() {
        onCloseButtonTapped?()
    }
}
