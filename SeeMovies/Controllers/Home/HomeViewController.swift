//
//  HomeViewViewController.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var screen = HomeView()
    private lazy var viewModel = HomeViewModel()
    
    override func loadView() {
        super.loadView()
        
        self.view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getMovies()
    }

    private func setupNavigationBar() {
        self.navigationItem.titleView = PrimaryLogo(frame: .zero)
    }
}
