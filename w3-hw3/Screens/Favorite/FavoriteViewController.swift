//
//  FavoriteViewController.swift
//  w3-hw3
//
//  Created by Cagla Efendioglu on 8.10.2022.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    
    //MARK: - UI
    
    private lazy var favoriteListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let favoriteCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        favoriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoriteCollectionView.backgroundColor = .white
        favoriteCollectionView.register( FavoriteCollectionViewCell.self,
                                 forCellWithReuseIdentifier: FavoriteCollectionViewCell.Identifier.identifier.rawValue)
        
        return favoriteCollectionView
    }()
    
    //MARK: - Properties
    
    private var favoriteList: [Favorites] = []
    private let context = appDelegate.persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate()
        configure()
        configureConstraints()
        getFavorite()
      
    }
    
    private func delegate() {
        favoriteListCollectionView.delegate = self
        favoriteListCollectionView.dataSource = self
    }
    
    private func configure() {
        view.backgroundColor = .white
        view.addSubview(favoriteListCollectionView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            favoriteListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            favoriteListCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            favoriteListCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            favoriteListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    func getFavorite() {
        do {
            favoriteList = try context.fetch(Favorites.fetchRequest())
            DispatchQueue.main.async {
                self.favoriteListCollectionView.reloadData()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCollectionViewCell.Identifier.identifier.rawValue, for: indexPath) as! FavoriteCollectionViewCell
        
        cell.saveCell(data: favoriteList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let with = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 30
        let width = (with - 30) / 2
        let height = width * 1.20
        return CGSize(width: width, height: height)
    }

}
