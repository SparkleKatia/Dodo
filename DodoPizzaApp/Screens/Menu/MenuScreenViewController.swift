//
//  ViewController.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 27/04/2025.
//

import UIKit

// MARK: - MenuScreenViewController

final class MenuScreenViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let productService = ProductsService()
    private let bannerService = BannersService()
    private let categoryService = CategoryService()
    private var products: [Product] = []
    private var banners: [Banner] = []
    private var categories: [ICategory] = []
    
    // MARK: - Subviews
    
    private lazy var cartButton = CartButton()
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // separate component
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.layer.cornerRadius = 25
        tableView.dataSource = self
        tableView.delegate = self
            //generic
        tableView.register(CategoryContainerHeader.self, forHeaderFooterViewReuseIdentifier: CategoryContainerHeader.reuseID)
        tableView.registerCell(BannerContainerCell.self)
        tableView.registerCell(ProductCell.self)
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        fetchProducts()
        setupObservers()
        fetchBanners()
        fetchCategories()
    }
    
    override func viewDidLayoutSubviews() {
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2

    }
}

// TODO: - Move it  to another file

@frozen public enum MenuSection: Int, CaseIterable {
    case banners = 0
    case products
}

// MARK: - UITableViewDelegate

extension MenuScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let menuSection = MenuSection(rawValue: section) else { return UIView() }
        
        switch menuSection {
        case .products:
            //generic for dequeueReusableHeaderFooterView
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryContainerHeader.reuseID) as? CategoryContainerHeader
            header?.update(categories: categories)
            return header
        default: return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuSection = MenuSection(rawValue: indexPath.section) else { return }
        
        switch menuSection {
        case .products:
            let product = products[indexPath.row]
           productCellSelect(product)
        default: return
        }
    }
}

// MARK: - UITableViewDataSource

extension MenuScreenViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let menuSection = MenuSection(rawValue: section) else { return 0 }
            
        switch menuSection {
        case .banners: return 1
        case .products: return products.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let menuSection = MenuSection(rawValue: indexPath.section) else { return  UITableViewCell()}
        
        switch menuSection {
        case .banners:
            let cell = tableView.dequeuCell(indexPath) as BannerContainerCell
            cell.update(banners: banners)
            return cell
        case .products:
            let cell = tableView.dequeuCell(indexPath) as ProductCell
            let product = products[indexPath.row]
            cell.update(product)
            return cell
        }
    }
}

//MARK: - Display Logic

extension MenuScreenViewController {
    func update(_ products: [Product]) {
        tableView.reloadSections(IndexSet(integer: MenuSection.products.rawValue), with: .none)
    }
    
    func update(_ banners: [Banner]) {
        tableView.reloadSections(IndexSet(integer: MenuSection.banners.rawValue), with: .automatic)
    }
}

//MARK: - Business Logic

extension MenuScreenViewController {
    
    private func fetchProducts() {
        productService.fetchProducts { [weak self] products in
            guard let self else { return }
            self.products = products
            update(products)
        }
    }
    
    private func fetchBanners() {
        bannerService.fetchBanners { [weak self] banners in
            guard let self else { return }
            self.banners = banners
            update(banners)
        }
    }
    
    private func fetchCategories() {
        categoryService.fetchCategories { [weak self] categories in
            guard let self else { return }
            self.categories = categories
            update(products)
        }
    }
}

//MARK: - Navigation

extension MenuScreenViewController {
    
    func navigateToDetailScreen(with product: Product) {
        let detailVC = DetailProductViewController(product: product)
        present(detailVC, animated: true)
    }
}

// MARK: - Actions (Event handlers)

extension MenuScreenViewController {
    
    private func setupObservers() {
        cartButton.onCartButtonTapped = {
            let cartVC = CartScreenViewController()
            self.present(cartVC, animated: true)
        }
    }
    
    func productCellSelect(_ product: Product) {
        navigateToDetailScreen(with: product)
    }
}

// MARK: - Layout

extension MenuScreenViewController {
    
    private func setupViews() {
        view.backgroundColor = .systemGray5
        view.addSubview(tableView)
        view.addSubview(cartButton)
        view.addSubview(profileImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 44),
            profileImageView.heightAnchor.constraint(equalToConstant: 44),
            
            tableView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            cartButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
}


