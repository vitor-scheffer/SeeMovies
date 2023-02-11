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
        
        setupDelegates()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon-arowLeft"), style: .plain, target: self, action: #selector(dismissSelf))
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationItem.titleView = PrimaryLogo(frame: .zero)
    }
    
    private func setupDelegates() {
        
        signUpView.delegate = self
        signUpView.nameField.delegate = self
        signUpView.emailField.delegate = self
        signUpView.passwordField.delegate = self
    }
    
    @objc private func dismissSelf() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.placeholder = ""
                
        if textField == signUpView.nameField {
            signUpView.nameField.placeholderLabel.isHidden = false
            
            UIView.animate(withDuration: 0.2) {
                self.signUpView.nameField.constraintTopPlaceholderLabel.constant = 8
            }
        }
        
        if textField == signUpView.emailField {
            signUpView.emailField.placeholderLabel.isHidden = false
            
            UIView.animate(withDuration: 0.2) {
                self.signUpView.emailField.constraintTopPlaceholderLabel.constant = 8
            }
        }
        
        if textField == signUpView.passwordField {
            signUpView.passwordField.placeholderLabel.isHidden = false
            
            UIView.animate(withDuration: 0.2) {
                self.signUpView.passwordField.constraintTopPlaceholderLabel.constant = 8
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty == true {
            
            if textField == signUpView.nameField {
                signUpView.nameField.placeholderLabel.isHidden = true
                signUpView.nameField.placeholder = "Name"
            }
            
            if textField == signUpView.emailField {
                signUpView.emailField.placeholderLabel.isHidden = true
                signUpView.emailField.placeholder = "Email"
            }
            
            if textField == signUpView.passwordField {
                signUpView.passwordField.placeholderLabel.isHidden = true
                signUpView.passwordField.placeholder = "Password"
            }
        }
    }
}

extension SignUpViewController: SignUpViewDelegate {
    
    func didPressPasswordVisibilityBtn() {
        if signUpView.passwordField.isSecureTextEntry {
            signUpView.passwordVisibilityBtn.setImage(UIImage(named: "icon-eye"), for: .normal)
            signUpView.passwordField.isSecureTextEntry = false
        } else {
            signUpView.passwordVisibilityBtn.setImage(UIImage(named: "icon-hidden"), for: .normal)
            signUpView.passwordField.isSecureTextEntry = true
        }
    }
}
