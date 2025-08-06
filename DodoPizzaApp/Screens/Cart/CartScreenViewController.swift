//
//  CartScreenVC.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 18/05/2025.
//

import UIKit

// MARK: - CartScreenViewController

class CartScreenViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var navBar = NavigationBarView()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .zero
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        tableView.registerCell(AdressCell.self)
        tableView.registerCell(CartProductCell.self)
        tableView.registerCell(GiftItemCell.self)
        tableView.registerCell(AddonContainerCell.self)
        tableView.registerCell(PromoCodeCell.self)
        tableView.registerCell(InfoCell.self)
        return tableView
    }()
    private lazy var orderButtonView = OrderButtonView()

}

// MARK: - UITableViewDataSource

extension CartScreenViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 4: return 1
        case 5: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeuCell(indexPath) as AdressCell
            // TODO: Is there any workarond for this hack with separator? -> It must be a separate view
           cell.separatorInset = UIEdgeInsets(top: 0,
                                              left: .greatestFiniteMagnitude,
                                              bottom: 0,
                                              right: 0)
            return cell
        case 1:
            let cell = tableView.dequeuCell(indexPath) as CartProductCell
            cell.update()
            return cell
        case 2:
            let cell = tableView.dequeuCell(indexPath) as GiftItemCell
            return cell
        case 3:
            let cell = tableView.dequeuCell(indexPath) as AddonContainerCell
            cell.separatorInset = UIEdgeInsets(top: 0,
                                               left: .greatestFiniteMagnitude,
                                               bottom: 0,
                                               right: 0)
            return cell
        case 4:
            let cell = tableView.dequeuCell(indexPath) as PromoCodeCell
            cell.separatorInset = UIEdgeInsets(top: 0,
                                               left: .greatestFiniteMagnitude,
                                               bottom: 0,
                                               right: 0)
            return cell
        case 5:
            let cell = tableView.dequeuCell(indexPath) as InfoCell
            cell.separatorInset = UIEdgeInsets(top: 0,
                                               left: .greatestFiniteMagnitude,
                                               bottom: 0,
                                               right: 0)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension CartScreenViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateNavBarTitleVisibility()
    }
}

// MARK: - Layout

extension CartScreenViewController {
    
    func setupViews() {
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        view.addSubview(tableView)
        view.addSubview(orderButtonView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: orderButtonView.topAnchor),

            orderButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orderButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            orderButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - LifeCycle

extension CartScreenViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        setupObservers()
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          updateNavBarTitleVisibility()
      }
}

// MARK: - Actions (Event Handlers)

extension CartScreenViewController {
    
    private func setupObservers() {
         navBar.onCloseButtonTapped  = { [weak self] in self?.dismiss(animated: true) }
         navBar.onDeleteButtonTapped = { [weak self] in self?.dismiss(animated: true) }
         orderButtonView.onOrderButtonTapped = {
             print("orderButton")
         }
     }
}

// MARK: - Update view

extension CartScreenViewController {
    
    private func updateNavBarTitleVisibility() {
        let indexPath = IndexPath(row: 0, section: 0)
        let isAddressVisible = tableView.indexPathsForVisibleRows?
            .contains(indexPath) ?? false
        navBar.setTitle("Grzybowska, 49D", visible: !isAddressVisible)
    }
}
