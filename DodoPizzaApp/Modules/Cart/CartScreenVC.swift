//
//  CartScreenVC.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 18/05/2025.
//

import UIKit

class CartScreenVC: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerCell(TotalCell.self)
        tableView.register(NavigationHeader.self, forHeaderFooterViewReuseIdentifier: NavigationHeader.reuseID)
        tableView.registerCell(AdressCell.self)

        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        tableView.registerCell(CartProductCell.self)
        return tableView
    }()
    
    private lazy var orderButtonView = OrderButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        setupObservers()
        
    }
    
    
    func setupViews() {
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        
        view.addSubview(tableView)
        view.addSubview(orderButtonView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            orderButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            orderButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            orderButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func setupObservers() {
        orderButtonView.onOrderButtonTapped = {
            print("orderButton")
        }
    }
}

extension CartScreenVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeuCell(indexPath) as AdressCell
            return cell
        case 1:
            let cell = tableView.dequeuCell(indexPath) as CartProductCell
            cell.update()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
               let header = tableView.dequeueReusableHeaderFooterView(
                              withIdentifier: NavigationHeader.reuseID) as? NavigationHeader
               header?.onCloseButtonTapped = { [weak self] in self?.dismiss(animated: true) }
               return header
        }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {

        return section == 0
             ? UITableView.automaticDimension     // use your NavigationHeader’s layout
             : .leastNormalMagnitude              // ≈ 0 pt → invisible
    }
}

extension CartScreenVC: UITableViewDelegate {
    
}
