//
//  SizeDoughSelectorCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 15/06/2025.
//

import UIKit

// MARK: - SizeDoughSelectorCell


func imageWithColor(_ color: UIColor) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: 50, height: 50)
    UIGraphicsBeginImageContext(rect.size)
    color.setFill()
    UIRectFill(rect)
    let img = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return img.resizableImage(withCapInsets: .zero)
}

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
        //control.selectedSegmentTintColor = .orange
        
        let grayBackground = imageWithColor(UIColor.systemGray6)
        let whiteColor = imageWithColor(UIColor.white)
//
        control.setBackgroundImage(grayBackground, for: .normal, barMetrics: .default)
        //control.setBackgroundImage(whiteColor, for: .selected, barMetrics: .default)
//        control.setDividerImage(grayBackground, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
//
//        if #available(iOS 15.0, *) {
//            let appearance = UISegmentedControl.appearance()
//            appearance.selectedSegmentTintColor = UIColor(white: 0.9, alpha: 1)
//            appearance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
//            appearance.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
//            //appearance.selectedSegmentTintColor
//        }
        control.selectedSegmentTintColor = .orange
        return control
    }()
    private lazy var doughControl: UISegmentedControl = {
        let control = UISegmentedControl.init(items: ["traditional", "Thin"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 1
        // TODO: Why gray color is different here?
        control.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
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
