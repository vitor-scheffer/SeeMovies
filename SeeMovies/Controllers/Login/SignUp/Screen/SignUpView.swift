//
//  SignUpView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import UIKit

class SignUpView: UIView {
    
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
    
    private lazy var logoView: PrimaryLogo = {
        let view = PrimaryLogo(frame: frame)
        
        return view
    }()
    
}

extension SignUpView: ViewCode {
    func buildHierarchy() {
        
        self.addSubview(bgSignIn)
        self.addSubview(logoView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            bgSignIn.topAnchor.constraint(equalTo: self.topAnchor),
            bgSignIn.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgSignIn.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgSignIn.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            logoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoView.centerXAnchor.constraint(equalTo: centerXAnchor),
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
