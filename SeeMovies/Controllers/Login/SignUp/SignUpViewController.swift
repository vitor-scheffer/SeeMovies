//
//  SignUpViewController.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private lazy var signUpView = SignUpView()
    
    override func loadView() {
        super.loadView()
        
        self.view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon-arowLeft"), style: .plain, target: self, action: #selector(dismissSelf))
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationItem.titleView = PrimaryLogo(frame: .zero)
    }
    
    @objc private func dismissSelf() {
        self.navigationController?.popViewController(animated: true)
    }
}
