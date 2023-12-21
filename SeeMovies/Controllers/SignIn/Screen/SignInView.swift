//
//  SignInView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    
    func didPressSignInBtn(input: SignInInput)
    func didPressPasswordVisibilityBtn()
}

class SignInView: UIView {
    
    weak var delegate: SignInViewDelegate?
    
    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bgSignIn: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "bgLaunch")
        return view
    }()
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 32, weight: .light)
        label.text = I18n.SignIn.title.text
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailField: SMTextField = {
        let field = SMTextField(placeholder: I18n.General.email.text)
        
        return field
    }()
    
    lazy var passwordField: SMTextField = {
        let field = SMTextField(placeholder: I18n.General.password.text)
        
        field.isSecureTextEntry = true
        return field
    }()
    
    lazy var passwordVisibilityBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "icon-hidden"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(didPressPasswordVisibilityBtn), for: .touchUpInside)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailField, passwordField])
        
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var signInButton: SMButton = {
        let button = SMButton(title: I18n.General.signIn.text)
        
        button.addTarget(self, action: #selector(didPressSignInBtn), for: .touchUpInside)
        return button
    }()
    
    @objc private func didPressSignInBtn() {
        guard let email = emailField.text,
              let password = passwordField.text
        else { return }
        
        let input = SignInInput(email: email, password: password)
        self.delegate?.didPressSignInBtn(input: input)
    }
    
    @objc private func didPressPasswordVisibilityBtn() {
        self.delegate?.didPressPasswordVisibilityBtn()
    }
}

extension SignInView: ViewCode {
    func buildHierarchy() {
        passwordField.addSubview(passwordVisibilityBtn, constraints: true)
        addSubviews([bgSignIn,
                    titlelabel,
                    stackView,
                    signInButton], constraints: true)
    }
    
    func setupConstraints() {
        bgSignIn.smc
            .top()
            .leading()
            .trailing()
            .bottom()
        
        titlelabel.smc
            .top(safeAreaLayoutGuide.topAnchor, 32)
            .leading(24)
            .trailing(24)
        
        passwordVisibilityBtn.smc
            .trailing(20)
            .centerY()
        
        stackView.smc
            .top(titlelabel.bottomAnchor, 56)
            .leading(24)
            .trailing(24)
        
        signInButton.smc
            .leading(24)
            .trailing(24)
            .bottom(safeAreaLayoutGuide.bottomAnchor, 24)

    }
    
    func applyAdditionalChanges() {}
}

#if DEBUG
import SwiftUI

struct SignInView_Provider: PreviewProvider {
    static var previews: some View {
        return SignInView().showPreview()
    }
}
#endif
