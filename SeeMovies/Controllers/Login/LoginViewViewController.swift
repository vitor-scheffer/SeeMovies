//
//  LoginViewViewController.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

class LoginViewViewController: UIViewController {
    
    private lazy var loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
    }

    private func setupDelegates() {
        loginView.delegate = self
    }
}

extension LoginViewViewController: LoginViewDelegate {
    func didPressAvatar() {
        let controller = SignInViewController()
        
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}
