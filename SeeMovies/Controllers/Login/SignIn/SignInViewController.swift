//
//  SignInViewController.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import UIKit

class SignInViewController: UIViewController {
    
    private lazy var signInView = SignInView()
    
    override func loadView() {
        super.loadView()
        
        self.view = signInView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
