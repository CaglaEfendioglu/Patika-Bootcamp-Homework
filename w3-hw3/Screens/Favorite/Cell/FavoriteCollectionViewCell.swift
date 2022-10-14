//
//  FavoriteCollectionViewCell.swift
//  w3-hw3
//
//  Created by Cagla Efendioglu on 8.10.2022.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    //MARK: - UI
    
    private lazy var  searchImage = UIImageView()
    
    private lazy var  searchName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var  searchPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    enum Identifier: String {
        case identifier = "Cell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(searchImage)
        contentView.addSubview(searchName)
        contentView.addSubview(searchPrice)
        
        searchImage.translatesAutoresizingMaskIntoConstraints = false
    
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 8
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            searchImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            searchImage.heightAnchor.constraint(equalToConstant: contentView.frame.size.height / 1.6),
            searchImage.widthAnchor.constraint(equalToConstant: contentView.frame.size.width),
        ])
        
        NSLayoutConstraint.activate([
            searchName.topAnchor.constraint(equalTo: searchImage.bottomAnchor, constant: 8),
            searchName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            searchName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            searchPrice.topAnchor.constraint(equalTo: searchName.bottomAnchor, constant: 8),
            searchPrice.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            searchPrice.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
        ])
    }
    
    
    private func getImage(value: String) {
        if let url = URL(string: value) {
            DispatchQueue.global().async {
                let data  = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    guard let dataTwo = data else { return }
                    self.searchImage.image = UIImage(data: dataTwo)
                }
            }
        }
    }

    func saveCell(data: Favorites) {
        if let name = data.name, let image = data.image {
                    searchName.text = "Name: \(name)"
                    searchPrice.text = "Price: \(data.price)"
                    getImage(value: image)
        }
    }
}
