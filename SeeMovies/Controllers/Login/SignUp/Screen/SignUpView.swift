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
    
}

extension SignUpView: ViewCode {
    func buildHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func applyAdditionalChanges() {
        
    }
}

#if DEBUG
import SwiftUI

struct SignUpView_Preview: PreviewProvider {
    static var previews: some View {
        return SignUpView().showPreview()
    }
}
#endif
