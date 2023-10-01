//
//  LoginViewViewController.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private lazy var screen = OnboardingView()
    
    override func loadView() {
        super.loadView()
        
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
    }

    private func setupDelegates() {
        screen.delegate = self
    }
}

extension OnboardingViewController: OnboardingViewDelegate {
    func didPressSignUpBtn() {
        let controller = SignUpViewController()
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func didPressAvatar() {
        let controller = SignInViewController()
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
