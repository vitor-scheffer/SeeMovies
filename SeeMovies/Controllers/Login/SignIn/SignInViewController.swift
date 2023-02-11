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
        
        setupDelegates()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon-arowLeft"), style: .plain, target: self, action: #selector(dismissSelf))
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationItem.titleView = PrimaryLogo(frame: .zero)
    }
    
    private func setupDelegates() {
        
        signInView.delegate = self
        signInView.emailField.delegate = self
        signInView.passwordField.delegate = self
    }
    
    @objc private func dismissSelf() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SignInViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.placeholder = ""
        
        if textField == signInView.emailField {
            signInView.emailField.placeholderLabel.isHidden = false
            
            UIView.animate(withDuration: 0.2) {
                self.signInView.emailField.constraintTopPlaceholderLabel.constant = 8
            }
        }
        
        if textField == signInView.passwordField {
            signInView.passwordField.placeholderLabel.isHidden = false
            
            UIView.animate(withDuration: 0.2) {
                self.signInView.passwordField.constraintTopPlaceholderLabel.constant = 8
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty == true {
            
            if textField == signInView.emailField {
                signInView.emailField.placeholderLabel.isHidden = true
                signInView.emailField.placeholder = "Email"
            }
            
            if textField == signInView.passwordField {
                signInView.passwordField.placeholderLabel.isHidden = true
                signInView.passwordField.placeholder = "Password"
            }
        }
    }
}

extension SignInViewController: SignInViewDelegate {
    
    func didPressPasswordVisibilityBtn() {
        if signInView.passwordField.isSecureTextEntry {
            signInView.passwordVisibilityBtn.setImage(UIImage(named: "icon-eye"), for: .normal)
            signInView.passwordField.isSecureTextEntry = false
        } else {
            signInView.passwordVisibilityBtn.setImage(UIImage(named: "icon-hidden"), for: .normal)
            signInView.passwordField.isSecureTextEntry = true
        }
    }
}
