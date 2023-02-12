//
//  FavoritesView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 11/02/23.
//

import UIKit

class FavoritesView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesView: ViewCode {
    
    func buildHierarchy() {}
    
    func setupConstraints() {}
    
    func applyAdditionalChanges() {
        self.backgroundColor = .gray700
    }
    
}
