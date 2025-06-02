//
//  NavigationHeader.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 01/06/2025.
//
import UIKit

final class NavigationHeader: UITableViewHeaderFooterView {

    static let reuseID = "NavigationHeader"
    
    var onCloseButtonTapped: (()->())?
    
    private lazy var closeButton: UIButton = {
        var button = UIButton()
        button.setTitle("Close", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        var cfg = UIButton.Configuration.plain()
        cfg.contentInsets = .zero
        button.configuration = cfg
        let normalColor = UIColor(red: 235/255,
                                      green: 113/255,
                                      blue:  50/255,
                                      alpha: 1.0)
        button.setTitleColor(normalColor, for: .normal)
        button.setTitleColor(normalColor.withAlphaComponent(0.4),
                                 for: .highlighted)

        button.addTarget(nil, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        let symbolCfg = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        configuration.image = UIImage(systemName: "trash")?.withConfiguration(symbolCfg).withRenderingMode(.alwaysTemplate)
        let color =  UIColor(
            red:   235.0 / 255.0,
            green: 113.0 / 255.0,
            blue:   50.0 / 255.0,
            alpha:  1.0
        )
        configuration.baseForegroundColor = .systemBackground
        configuration.baseForegroundColor = color
        configuration.imagePadding = 0
        configuration.baseBackgroundColor = .systemBackground
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(nil, action: #selector(cartButtonTap), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(closeButton)
        contentView.addSubview(deleteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            closeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc private func closeButtonTapped() {
        onCloseButtonTapped?()
    }
}
