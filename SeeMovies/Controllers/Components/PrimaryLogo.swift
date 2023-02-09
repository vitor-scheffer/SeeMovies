//
//  PrimaryLogo.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import UIKit

class PrimaryLogo: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PrimaryLogo: ViewCode {
    
    func buildHierarchy() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.widthAnchor.constraint(equalToConstant: 100),
            self.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func applyAdditionalChanges() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(named: "logo")
        self.contentMode = .scaleAspectFit
    }

}
