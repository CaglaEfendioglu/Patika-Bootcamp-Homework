//
//  SoftwareListViewController.swift
//  w3-hw3
//
//  Created by Cagla Efendioglu on 8.10.2022.
//

import UIKit

class EbookListViewController: UIViewController {
    
    //MARK: - UI
    
    private lazy var searchBar: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "search ebook"
        search.searchBar.showsCancelButton = true
        return search
    }()
    
    private lazy var ebookListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let productCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        productCollectionView.translatesAutoresizingMaskIntoConstraints = false
        productCollectionView.backgroundColor = .white
        productCollectionView.register( EbookListCollectionViewCell.self,
                                        forCellWithReuseIdentifier: EbookListCollectionViewCell.Identifier.identifier.rawValue)
        
        return productCollectionView
    }()
    
    //MARK: - Properties
    
    private var ebookItem: [Search] = []
    private var service: ISearchService?
    private let termKey = ""
    private let mediaKey = "ebook"
    
    init(service: ISearchService) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
        configure()
        configureConstraints()
        NavitaionBarConfigure()
        
    }
    
    //MARK: - Methods
    
    private func delegate() {
        navigationItem.searchController = searchBar
        searchBar.searchBar.delegate = self
        ebookListCollectionView.delegate = self
        ebookListCollectionView.dataSource = self
    }
    
    private func configure() {
        view.backgroundColor = .white
        view.addSubview(ebookListCollectionView)
    }
    
    private func NavitaionBarConfigure() {
        let rightButton = UIBarButtonItem(title: "Favorites", style: .plain , target: self, action: #selector(favorite(_:)))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func favorite(_ navigationItem: UIBarButtonItem) {
        let favoriteViewController =  FavoriteViewController()
        self.present(favoriteViewController, animated: true)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            ebookListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            ebookListCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            ebookListCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            ebookListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    private func fetchService(searchKey: String) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchKey)&media=\(mediaKey)") else { return }
        service?.fetchSearch(url: url, onSuccess: { search in
            self.ebookItem = search
            DispatchQueue.main.async {
                self.ebookListCollectionView.reloadData()
            }
        }, onFail: { error in
            print(error.localizedDescription)
        })
    }
}

extension EbookListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ebookItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EbookListCollectionViewCell.Identifier.identifier.rawValue, for: indexPath) as! EbookListCollectionViewCell
        
        cell.saveCell(data: ebookItem[indexPath.row])
        
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ebookItemDataTwo = ebookItem[indexPath.row]
        let detailViewController = EbookDetailViewController(ebookDetail: ebookItemDataTwo)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

extension EbookListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        fetchService(searchKey: searchText)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        fetchService(searchKey: "")
        DispatchQueue.main.async {
            self.ebookListCollectionView.reloadData()
        }
    }
}
