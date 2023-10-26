//
//  PrimaryLogo.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import UIKit

class SMLogo: UIImageView {
    
    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
}

extension SMLogo: ViewCode {
    
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
