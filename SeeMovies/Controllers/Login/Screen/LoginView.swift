//
//  LoginView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

class LoginView: UIView {
    
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
    
    private lazy var logoView: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFit
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
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "avatar"), for: .normal)
        button.borderWidth = 5
        button.cornerRadius = 80
        button.borderColor = .purple700
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.text = "Vitor Scheffer"
        label.textColor = .white
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray100.withAlphaComponent(0.2)
        button.setTitle("+ USER", for: .normal)
        button.cornerRadius = 15
        return button
    }()
}

extension LoginView: ViewCode {
    func buildHierarchy() {
        self.addSubview(bgLoginView)
        self.addSubview(logoView)
        self.addSubview(titlelabel)
        self.addSubview(avatarView)
        self.addSubview(nameLabel)
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
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 50),
            
            titlelabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 32),
            titlelabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            avatarView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            
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

