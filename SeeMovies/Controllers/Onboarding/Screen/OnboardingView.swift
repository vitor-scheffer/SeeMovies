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
    
    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bgOnboardingView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "bgLogin")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var logoView: SMLogo = {
        let view = SMLogo()
        
        return view
    }()
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 32, weight: .light)
        label.text = I18n.Onboarding.title.text
        label.textColor = .white
        return label
    }()
    
    private lazy var avatarView: UIButton = {
        let button = UIButton()
        let titleBtn = NSMutableAttributedString(string: "+",
                                                 attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 60, weight: .bold)])
        
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
        
        button.backgroundColor = .gray100.withAlphaComponent(0.2)
        button.setTitle(I18n.General.signUp.text, for: .normal)
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
        addSubviews([bgOnboardingView,
                    logoView,
                    titlelabel,
                    avatarView,
                    signUpButton], constraints: true)
    }
    
    func setupConstraints() {
        bgOnboardingView.smc
            .top()
            .leading()
            .trailing()
            .bottom()
        
        logoView.smc
            .top(safeAreaLayoutGuide.topAnchor)
            .centerX()
        
        titlelabel.smc
            .top(logoView.bottomAnchor, 32)
            .centerX()
        
        avatarView.smc
            .centerX()
            .centerY()
        
        avatarView.setSize(width: 160, height: 160)
        
        signUpButton.smc
            .bottom(safeAreaLayoutGuide.bottomAnchor, 24)
            .centerX()
        
        signUpButton.setSize(width: 100, height: 30)
    }
    
    func applyAdditionalChanges() {}
}

#if DEBUG
import SwiftUI

struct OnboardingView_Preview: PreviewProvider {
    static var previews: some View {
        return OnboardingView().showPreview()
    }
}
#endif

