//
//  PodcastDetailViewController.swift
//  w3-hw3
//
//  Created by Cagla Efendioglu on 8.10.2022.
//

import UIKit

class PodcastDetailViewController: UIViewController {
    
    
    //MARK: UI
    
    private  var searchImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private  var searchName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private  var searchPrice: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private  var searchDescription: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Favorites", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        return button
    }()
    
    
    private  var parentScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    private let parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    //MARK: - Properties
    
    private var podcastDetail: Search?
    private let context = appDelegate.persistentContainer.viewContext
    
    init(podcastDetail: Search) {
        self.podcastDetail = podcastDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureConstraints()
        setupUI()
        favoriteButtonClicked()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(parentScrollView)
        parentScrollView.addSubview(parentStackView)
        parentStackView.addArrangedSubview(searchImage)
        parentStackView.addArrangedSubview(searchName)
        parentStackView.addArrangedSubview(searchPrice)
        parentStackView.addArrangedSubview(searchDescription)
        parentStackView.addArrangedSubview(favoriteButton)
    }
    
    private func favoriteButtonClicked() {
        favoriteButton.addTarget(self, action: #selector(favorite(_:)), for: .touchUpInside)
    }
    
    @objc func favorite(_ favoriteButton: UIButton) {
        let favorite =  Favorites(context: context)
        
        favorite.image = podcastDetail?.artworkUrl600
        favorite.name = podcastDetail?.trackName
        favorite.price = podcastDetail?.trackPrice ?? 0.0 
        
        appDelegate.saveContext()
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
    
    private func setupUI() {
        searchName.text = "Name: \(podcastDetail?.trackName ?? "")"
        searchPrice.text = "Price: \(podcastDetail?.trackPrice ?? 0.0)"
        searchDescription.text = podcastDetail?.longDescription ?? podcastDetail?.shortDescription ?? podcastDetail?.resultDescription ?? ""
        getImage(value: podcastDetail?.artworkUrl600 ?? "")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            parentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            parentScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            parentScrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            parentScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: parentScrollView.topAnchor, constant: 0),
            parentStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            parentStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            parentStackView.bottomAnchor.constraint(equalTo: parentScrollView.bottomAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            searchImage.heightAnchor.constraint(equalToConstant: view.frame.height/2.6),
            //searchImage.widthAnchor.constraint(equalToConstant: view.frame.width),
        ])
        
        NSLayoutConstraint.activate([
            favoriteButton.heightAnchor.constraint(equalToConstant: view.frame.size.height / 15),
            favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
