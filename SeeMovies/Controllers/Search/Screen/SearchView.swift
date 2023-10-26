//
//  SearchView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 11/02/23.
//

import UIKit

class SearchView: UIView {
    
    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView: ViewCode {
    
    func buildHierarchy() {}
    
    func setupConstraints() {}
    
    func applyAdditionalChanges() {
        backgroundColor = .gray700
    }
    
}
