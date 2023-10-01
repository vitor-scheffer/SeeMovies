//
//  LoginView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func didPressAvatar()
    func didPressSignUpBtn()
}

class OnboardingView: UIView {
    
    weak var delegate: OnboardingViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bgOnboardingView: UIImageView = {
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
        label.text = I18n.Onboarding.title.text
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

extension OnboardingView: ViewCode {
    func buildHierarchy() {
        self.addSubview(bgOnboardingView)
        self.addSubview(logoView)
        self.addSubview(titlelabel)
        self.addSubview(avatarView)
        self.addSubview(signUpButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            bgOnboardingView.topAnchor.constraint(equalTo: self.topAnchor),
            bgOnboardingView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgOnboardingView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgOnboardingView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
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

struct OnboardingView_Preview: PreviewProvider {
    static var previews: some View {
        return OnboardingView().showPreview()
    }
}
#endif

