//
//  GiftItemCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 03/06/2025.
//

import UIKit

final class GiftItemCell: UITableViewCell {
    
    private let giftName: Label = Label(type: .name)
    private let giftDescription: Label = Label(type: .description)
    private let giftImageView: ImageView = ImageView(type: .cart)
    private let giftPrice: Label = Label(type: .cart)
    private let stepper: CustomStepper = CustomStepper()
    private let verticalStackView: StackView = StackView(type: .productCell)
    
    private lazy var giftIcon: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "gift-box")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.carrot
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var giftIconLabel: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.carrot
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let horisontalStackView: StackView = StackView(type: .cartGift)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        update()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(giftImageView)
        contentView.addSubview(giftPrice)
        contentView.addSubview(stepper)
        
        horisontalStackView.addArrangedSubview(giftIcon)
        horisontalStackView.addArrangedSubview(giftIconLabel)
        
        verticalStackView.addArrangedSubview(giftName)
        verticalStackView.addArrangedSubview(giftDescription)
        verticalStackView.addArrangedSubview(horisontalStackView)
        
        contentView.addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            giftImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            giftImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            verticalStackView.leadingAnchor.constraint(equalTo: giftImageView.trailingAnchor, constant: 16),
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            
            giftPrice.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 32),
            giftPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            giftPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            stepper.topAnchor.constraint(equalTo: giftPrice.topAnchor),
            stepper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stepper.widthAnchor.constraint(equalToConstant: 90),
            stepper.heightAnchor.constraint(equalToConstant: 25),
            
            giftIcon.widthAnchor.constraint(equalToConstant: 16),
            giftIcon.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    func update() {
        giftName.text = "Pizza dox 30"
        giftDescription.text =  "1 pc"
        giftImageView.image = UIImage(named: "box")
        giftPrice.text = "0 zl"
        giftIconLabel.text = "Medium pizza box"
    }
}
