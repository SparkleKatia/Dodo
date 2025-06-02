//
//  CustomStepper.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 01/06/2025.
//
import UIKit

class CustomStepper: UIControl {
    
     var currentValue = 1 {
         didSet {
             currentValue = currentValue > 0 ? currentValue : 0
             currentStepValueLabel.text = "\(currentValue)"
         }
     }
     
     private lazy var decreaseButton: UIButton = {
        let button = UIButton()
         button.setTitleColor(.black, for: .normal)
         button.setTitle("-", for: .normal)
         button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
         return button
     }()
     
     private lazy var currentStepValueLabel: UILabel = {
         var label = UILabel()
         label.textColor = .black
         label.textAlignment = .center
         label.text = "\(currentValue)"
         label.font = UIFont.monospacedDigitSystemFont(ofSize: 12, weight: UIFont.Weight.regular)
         return label
     }()
     
     private lazy var increaseButton: UIButton = {
         let button = UIButton()
         button.setTitleColor(.black, for: .normal)
         button.setTitle("+", for: .normal)
         button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
         return button
     }()
     
     private lazy var horizontalStackView: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.distribution = .fillEqually
         stackView.spacing = 15
         return stackView
     }()
     
     //MARK: - Life Cycle
     override init(frame: CGRect) {
         super.init(frame: frame)
         setupViews()
         setupContraints()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     //MARK: - Private
     private func setupViews() {
         backgroundColor = .systemGray6
         layer.cornerRadius = 12
         
         addSubview(horizontalStackView)
         horizontalStackView.addArrangedSubview(decreaseButton)
         horizontalStackView.addArrangedSubview(currentStepValueLabel)
         horizontalStackView.addArrangedSubview(increaseButton)
     }
     
     private func setupContraints() {
         horizontalStackView.translatesAutoresizingMaskIntoConstraints = false

         NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
         ])
     }
     
     //MARK: - Actions
     @objc private func buttonAction(_ sender: UIButton) {
         switch sender {
         case decreaseButton:
             currentValue -= 1
         case increaseButton:
             currentValue += 1
         default:
             break
         }
         sendActions(for: .touchUpInside)
     }
}
