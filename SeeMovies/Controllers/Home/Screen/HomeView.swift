//
//  HomeView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeView: ViewCode {
    func buildHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func applyAdditionalChanges() {
        self.backgroundColor = .white
    }
}
