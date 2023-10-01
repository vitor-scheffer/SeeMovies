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
        self.navigationItem.titleView = PrimaryLogo(frame: .zero)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "SIGN OUT", style: .plain, target: self, action: #selector(didPressSignOutBtn))
    }
    
    @objc private func didPressSignOutBtn() {
        let controller = UINavigationController(rootViewController: OnboardingViewController())
        
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
    func setCollecttionViewDataSource() {
        self.screen.movieCollectionView.delegate = self
        self.screen.movieCollectionView.dataSource = self
        
        self.screen.movieCollectionView.reloadData()
    }
    
    func setLoading() {
        self.view.addLoading()
    }
    
    func removeLoading() {
        self.view?.removeLoading()
    }
}



extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfMovieRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = screen.movieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {return UICollectionViewCell()}
        
        let movie = viewModel.getCurrentMovie(index: indexPath)
            
        cell.setupCell(title: movie.title)
        
        return cell
    }
}
