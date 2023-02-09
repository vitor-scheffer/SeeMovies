//
//  LoginView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didPressAvatar()
    func didPressSignUpBtn()
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bgLoginView: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "bgLogin")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var logoView: PrimaryLogo = {
        let view = PrimaryLogo(frame: frame)
        
        return view
    }()
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .light)
        label.text = "Who Is Watching?"
        label.textColor = .white
        return label
    }()
    
    private lazy var avatarView: UIButton = {
        let button = UIButton()
        let titleBtn = NSMutableAttributedString(string: "+",
                                                 attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 60, weight: .bold)])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(titleBtn, for: .normal)
        button.borderWidth = 5
        button.cornerRadius = 80
        button.borderColor = .purple700
        button.tintColor = .white
        button.backgroundColor = .gray100.withAlphaComponent(0.1)
        button.addTarget(self, action: #selector(didPressAvatar), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray100.withAlphaComponent(0.2)
        button.setTitle("Sign Up", for: .normal)
        button.cornerRadius = 15
        button.addTarget(self, action: #selector(didPressSignUpBtn), for: .touchUpInside)
        return button
    }()
    
    @objc private func didPressAvatar() {
        self.delegate?.didPressAvatar()
    }
    
    @objc private func didPressSignUpBtn() {
        self.delegate?.didPressSignUpBtn()
    }
}

extension LoginView: ViewCode {
    func buildHierarchy() {
        self.addSubview(bgLoginView)
        self.addSubview(logoView)
        self.addSubview(titlelabel)
        self.addSubview(avatarView)
        self.addSubview(signUpButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            bgLoginView.topAnchor.constraint(equalTo: self.topAnchor),
            bgLoginView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgLoginView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgLoginView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            logoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            titlelabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 32),
            titlelabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            avatarView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: 160),
            avatarView.widthAnchor.constraint(equalToConstant: 160),
            
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32),
            signUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 100),
            signUpButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func applyAdditionalChanges() {
        self.backgroundColor = .white
    }
}

#if DEBUG
import SwiftUI

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        return LoginView().showPreview()
    }
}
#endif

