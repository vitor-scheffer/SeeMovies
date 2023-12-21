//
//  SignInViewController.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import UIKit

class SignInViewController: UIViewController {
    
    private lazy var screen = SignInView()
    
    override func loadView() {
        super.loadView()
        
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon-arowLeft"), style: .plain, target: self, action: #selector(dismissSelf))
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationItem.titleView = SMLogo()
    }
    
    private func setupDelegates() {
        
        screen.delegate = self
        screen.emailField.delegate = self
        screen.passwordField.delegate = self
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
        
        if textField == screen.emailField {
            screen.emailField.placeholderLabel.isHidden = false
            
            UIView.animate(withDuration: 0.2) {
                self.screen.emailField.constraintTopPlaceholderLabel.constant = 8
            }
        }
        
        if textField == screen.passwordField {
            screen.passwordField.placeholderLabel.isHidden = false
            
            UIView.animate(withDuration: 0.2) {
                self.screen.passwordField.constraintTopPlaceholderLabel.constant = 8
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty == true {
            
            if textField == screen.emailField {
                screen.emailField.placeholderLabel.isHidden = true
                screen.emailField.placeholder = "Email"
            }
            
            if textField == screen.passwordField {
                screen.passwordField.placeholderLabel.isHidden = true
                screen.passwordField.placeholder = "Password"
            }
        }
    }
    
    private func formValidate(formData: SignInInput) -> String? {
        if formData.email.isEmpty {
            return "email"
        }
        if formData.password.isEmpty {
            return "password"
        }
        
        return nil
    }
}

extension SignInViewController: SignInViewDelegate {
    func didPressSignInBtn(input: SignInInput) {
        let formErrors = formValidate(formData: input)
        
        if formErrors == nil {
            // realizar requisição
            
            view.addLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {self.view.removeLoading()})
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1, execute: {
                let controller = MainTabBarViewController()
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true)
            })
        } else {
            addAlert(title: "Ocorreu um erro",
                     message: "O campo \(formErrors!) não foi preenchido.",
                     cancelAction: "Ok")
        }
    }
    
    func didPressPasswordVisibilityBtn() {
        if screen.passwordField.isSecureTextEntry {
            screen.passwordVisibilityBtn.setImage(UIImage(named: "icon-eye"), for: .normal)
            screen.passwordField.isSecureTextEntry = false
        } else {
            screen.passwordVisibilityBtn.setImage(UIImage(named: "icon-hidden"), for: .normal)
            screen.passwordField.isSecureTextEntry = true
        }
    }
}
