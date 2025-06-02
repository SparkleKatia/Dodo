//
//  TotalCell.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 18/05/2025.
//


import UIKit


class TotalCell: UITableViewCell {
    
    static let reuseID = "TotalCell"
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "1 product with price 2000 p"
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        contentView.addSubview(totalLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            totalLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            totalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            totalLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            totalLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
