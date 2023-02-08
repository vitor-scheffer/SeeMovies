//
//  HomeViewViewController.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

class HomeViewViewController: UIViewController {
    
    private lazy var homeView = HomeView()
    
    override func loadView() {
        super.loadView()
        
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
