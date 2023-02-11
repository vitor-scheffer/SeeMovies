//
//  SignUpView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    
    func didPressPasswordVisibilityBtn()
}

class SignUpView: UIView {
    
    weak var delegate: SignUpViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bgSignIn: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "bgLaunch")
        return view
    }()
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .light)
        label.text = "Create your HBO Max account"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameField: PrimaryTextField = {
        let field = PrimaryTextField(placeholder: "Name")
        
        return field
    }()
    
    lazy var emailField: PrimaryTextField = {
        let field = PrimaryTextField(placeholder: "Email")
        
        return field
    }()
    
    lazy var passwordField: PrimaryTextField = {
        let field = PrimaryTextField(placeholder: "Password")
        
        field.isSecureTextEntry = true
        return field
    }()
    
    lazy var passwordVisibilityBtn: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "icon-hidden"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(didPressPasswordVisibilityBtn), for: .touchUpInside)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameField, emailField, passwordField])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var signUpButton: PrimaryButton = {
        let button = PrimaryButton(title: "SIGN UP")
        
        return button
    }()
    
    @objc private func didPressPasswordVisibilityBtn() {
        self.delegate?.didPressPasswordVisibilityBtn()
    }
}

extension SignUpView: ViewCode {
    func buildHierarchy() {
        
        self.addSubview(bgSignIn)
        self.addSubview(titlelabel)
        passwordField.addSubview(passwordVisibilityBtn)
        self.addSubview(stackView)
        self.addSubview(signUpButton)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            bgSignIn.topAnchor.constraint(equalTo: self.topAnchor),
            bgSignIn.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgSignIn.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgSignIn.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titlelabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titlelabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            titlelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            passwordVisibilityBtn.centerYAnchor.constraint(equalTo: passwordField.centerYAnchor),
            passwordVisibilityBtn.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            signUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
        
        ])
    }
    
    func applyAdditionalChanges() {}
}

#if DEBUG
import SwiftUI

struct SignUpView_Preview: PreviewProvider {
    static var previews: some View {
        return SignUpView().showPreview()
    }
}
#endif
