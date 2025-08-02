//
//  SizeDoughSelectorCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 15/06/2025.
//

import UIKit

// MARK: - SizeDoughSelectorCell

final class SizeDoughSelectorCell: UITableViewCell {
    
    // MARK: - Static
    
    static let reuseID = "SizeDoughSelectorCell"
    
    // MARK: - Public
    
    var onSizeChanged:  ((PizzaSize)  -> Void)?
    var onDoughChanged: ((DoughType) -> Void)?
    
    // MARK: - Actions (Event Listiners)
    
    private(set) var selectedSize:  PizzaSize  = .medium30 { didSet { onSizeChanged?(selectedSize) } }
    private(set) var selectedDough: DoughType = .traditional { didSet { onDoughChanged?(selectedDough) } }
    
    // MARK: - Subviews
    
    private lazy var sizeControl: UISegmentedControl = {
        let control = UISegmentedControl.init(items: ["20 sm", "30 sm", "35 sm"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        control.backgroundColor = .systemGray6
        return control
    }()
    private lazy var doughControl: UISegmentedControl = {
        let control = UISegmentedControl.init(items: ["traditional", "Thin"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 1
        // TODO: Why gray color is different here?
        control.backgroundColor = .systemGray6
        control.layer.cornerRadius = 12
        control.clipsToBounds = true
        return control
    }()
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = Layout.offset6
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
}

// MARK: - Layout

extension SizeDoughSelectorCell {
    
    private func setupViews() {
        verticalStackView.addArrangedSubview(sizeControl)
        verticalStackView.addArrangedSubview(doughControl)
        contentView.addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            sizeControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sizeControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            doughControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            doughControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
