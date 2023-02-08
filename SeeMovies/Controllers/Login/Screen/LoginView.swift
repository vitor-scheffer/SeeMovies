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
        view.image = UIImage(named: "BgLogin")
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
}

extension LoginView: ViewCode {
    func buildHierarchy() {
        self.addSubview(bgLoginView)
        self.addSubview(logoView)
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

