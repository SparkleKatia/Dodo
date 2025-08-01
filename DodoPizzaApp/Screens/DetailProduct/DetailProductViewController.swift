//
//  DetailProductVC.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 08/06/2025.
//

import UIKit

// MARK: - DetailProductViewController

final class DetailProductViewController: UIViewController {

    // MARK: - Private properties
    
    private var ingredients = [
        Ingredient(name: "Креветки", image: "ham2", price: 50),
        Ingredient(name: "Креветки", image: "ham2", price: 50),
        Ingredient(name: "Креветки", image: "ham2", price: 50),
        Ingredient(name: "Креветки", image: "ham2", price: 50),
        Ingredient(name: "Креветки", image: "ham2", price: 50),
        Ingredient(name: "Креветки", image: "ham2", price: 50),
        Ingredient(name: "Креветки", image: "ham2", price: 50)
    ]
    
    // MARK: - Subviews
    
    private lazy var orderButtonView = OrderButtonView()
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerCell(ProductImageCell.self)
        tableView.registerCell(DescriptionCell.self)
        tableView.registerCell(IngredientChipContainer.self)
        tableView.registerCell(SizeDoughSelectorCell.self)
        tableView.registerCell(IngredientCollectionContainerCell.self)
        return tableView
    }()
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        button.setImage(UIImage(systemName: "chevron.down",withConfiguration: sizeConfig), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 22
        button.layer.shadowColor   = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.15
        button.layer.shadowRadius  = 4
        button.layer.shadowOffset  = .zero
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(closeButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstarints()
    }
    
    @objc private func closeButtonTapped() {
         self.dismiss(animated: true)
    }
    
}

// TODO: - Move to another file

public enum ProductInfoSection: Int, CaseIterable {
    case productImage
    case productDescription
    case ingridientChip
    case sizeDoughSelector
    case ingredientContainer
}

// MARK: - Layout

extension DetailProductViewController {
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        view.addSubview(closeButton)
        view.addSubview(orderButtonView)
    }
    
    private func setupConstarints() {
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: 16),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                             constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: orderButtonView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            orderButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orderButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            orderButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - DetailProductViewController

extension DetailProductViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProductInfoSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let productInfoSection = ProductInfoSection(rawValue: section) else { return 0 }
        
        switch productInfoSection {
        case .productImage: return 1
        case .productDescription: return 1
        case .ingridientChip: return 1
        case .sizeDoughSelector: return 1
        case .ingredientContainer: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let productInfoSection = ProductInfoSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch productInfoSection {
        case .productImage:
            let cell = tableView.dequeuCell(indexPath) as ProductImageCell
            
            // TODO: Moved removing separator to UITableViewCell extension, is it ok?
            
            cell.removeSeparator()
            return cell
        case .productDescription:
            let cell = tableView.dequeuCell(indexPath) as DescriptionCell
            cell.removeSeparator()
            return cell
        case .ingridientChip:
            let cell = tableView.dequeuCell(indexPath) as IngredientChipContainer
            cell.removeSeparator()
            cell.update(ingredients)
            cell.onRemove = { [weak self] ing in
                guard let self else { return }
                if let idx = ingredients.firstIndex(of: ing) {
                    ingredients.remove(at: idx)
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            }
            return cell
            
        case .sizeDoughSelector:
            let cell = tableView.dequeuCell(indexPath) as SizeDoughSelectorCell
            cell.removeSeparator()
            return cell
        case .ingredientContainer:
            let cell = tableView.dequeuCell(indexPath) as IngredientCollectionContainerCell
            cell.removeSeparator()
            cell.update(ingredients)
            return cell
        }
    }
}

// MARK: - DetailProductViewController

extension DetailProductViewController: UITableViewDelegate { }
