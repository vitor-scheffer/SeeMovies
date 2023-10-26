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
        
        viewModel.delegate = self
                
        viewModel.getMovies()
    }

    private func setupNavigationBar() {
        self.navigationItem.titleView = SMLogo()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: I18n.General.signOut.text, style: .plain, target: self, action: #selector(didPressSignOutBtn))
    }
    
    @objc private func didPressSignOutBtn() {
        let controller = UINavigationController(rootViewController: OnboardingViewController())
        
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
    func setCollecttionViewDataSource() {
        
    }
    
    func setLoading() {
        view.addLoading()
    }
    
    func removeLoading() {
        view.removeLoading()
    }
}
