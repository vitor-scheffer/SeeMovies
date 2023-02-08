//
//  ViewCode.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

protocol ViewCode {
    
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
    
}

extension ViewCode {
    
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
}
