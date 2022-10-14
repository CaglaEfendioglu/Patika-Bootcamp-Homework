//
//  ItunesTabbarViewController.swift
//  w3-hw3
//
//  Created by Cagla Efendioglu on 8.10.2022.
//

import UIKit

class ItunesTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tabBar.backgroundColor = .lightGray
        navigationItem.hidesBackButton = true

   

     
        let VC1 = UINavigationController(rootViewController: PodcastListViewController(service: SearchService()))

        let VC2 = UINavigationController(rootViewController: MovieListViewController(service: SearchService()))

        let VC3 = UINavigationController(rootViewController: MusicListViewController(service: SearchService()))

        let VC4 = UINavigationController(rootViewController: SoftwareListViewController(service: SearchService()))
   
        let VC5 = UINavigationController(rootViewController: EbookListViewController(service: SearchService()))
        
        self.setViewControllers([VC1,VC2,VC3,VC4,VC5], animated: true)
 
        guard let item = self.tabBar.items else { return }
        
        
        item[0].title = "Podcast"
        item[1].title = "Movie"
        item[2].title = "Music"
        item[3].title = "Software"
        item[4].title = "Ebook"
        
    }

}
