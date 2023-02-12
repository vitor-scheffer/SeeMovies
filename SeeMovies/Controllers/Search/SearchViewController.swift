//
//  SearchViewController.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 11/02/23.
//

import UIKit

class SearchViewController: UIViewController {

    private lazy var screen = SearchView()
    
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

        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar() {
        self.navigationItem.titleView = PrimaryLogo(frame: .zero)
    }
}
