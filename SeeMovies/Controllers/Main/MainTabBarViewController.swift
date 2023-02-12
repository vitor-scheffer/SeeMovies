//
//  MainTabBarViewController.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 11/02/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        let home = UINavigationController(rootViewController: HomeViewController())
        let favorites = UINavigationController(rootViewController: FavoritesViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        
        self.setViewControllers([home, favorites, search], animated: true)
        
        self.tabBar.backgroundColor = .gray700.withAlphaComponent(0.5)
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .purple700
        self.tabBar.unselectedItemTintColor = .white
        
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowOpacity = 0.12
        self.tabBar.layer.shadowOffset = .zero
        self.tabBar.layer.shadowRadius = 5
        
        guard let item = self.tabBar.items else { return }
        item[0].image = UIImage(named: "icon-home")
        item[1].image = UIImage(named: "icon-star")
        item[2].image = UIImage(named: "icon-search")
        
        }
}
