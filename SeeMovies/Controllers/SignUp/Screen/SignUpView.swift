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
    
    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bgSignUp: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "bgLaunch")
        return view
    }()
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 32, weight: .light)
        label.text = I18n.SignUp.title.text
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameField: SMTextField = {
        let field = SMTextField(placeholder: "Name")
        
        return field
    }()
    
    lazy var emailField: SMTextField = {
        let field = SMTextField(placeholder: "Email")
        
        return field
    }()
    
    lazy var passwordField: SMTextField = {
        let field = SMTextField(placeholder: "Password")
        
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
        let stack = UIStackView(arrangedSubviews: [nameField, emailField, passwordField])
        
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var signUpButton: SMButton = {
        let button = SMButton(title: "SIGN UP")
        
        return button
    }()
    
    @objc private func didPressPasswordVisibilityBtn() {
        self.delegate?.didPressPasswordVisibilityBtn()
    }
}

extension SignUpView: ViewCode {
    func buildHierarchy() {
        passwordField.addSubview(passwordVisibilityBtn, constraints: true)
        
        addSubviews([bgSignUp,
                    titlelabel,
                    stackView,
                    signUpButton], constraints: true)
    }
    
    func setupConstraints() {
        bgSignUp.smc
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
        
        signUpButton.smc
            .leading(24)
            .trailing(24)
            .bottom(safeAreaLayoutGuide.bottomAnchor, 24)
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
