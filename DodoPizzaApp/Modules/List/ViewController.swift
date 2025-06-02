//
//  ViewController.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 09/05/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        
        let itemCount: CGFloat = 3
        let padding: CGFloat = 10
        let paddingCount = itemCount + 1
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        
        let paddingSize = padding * paddingCount
        let cellSize = (UIScreen.main.bounds.inset(by: view.safeAreaInsets).width - paddingSize) / itemCount
        
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        
        layout.itemSize = CGSize.init(width: 120, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .orange
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCollectionCell.self, forCellWithReuseIdentifier: PhotoCollectionCell.reuseId)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstarints()
    }
    
    func setupView() {
        view.addSubview(collectionView)
    }
    
    func setupConstarints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegate {

}

extension ViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 6
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.reuseId, for: indexPath) as! PhotoCollectionCell
            return cell
        }
}
