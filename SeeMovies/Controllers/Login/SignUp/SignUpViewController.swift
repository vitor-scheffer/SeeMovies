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

    }

}
