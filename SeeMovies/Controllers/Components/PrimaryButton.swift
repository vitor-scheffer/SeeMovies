//
//  PrimaryBtn.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import UIKit

class PrimaryButton: UIButton {
    
    var title: String = ""
    var isDisabled: Bool = false {
        didSet {
            self.isEnabled = false
            self.isUserInteractionEnabled = false
            self.backgroundColor = .gray300
            self.borderColor = .gray100
        }
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.title = title
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PrimaryButton: ViewCode {
    func buildHierarchy() {}
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func applyAdditionalChanges() {
        let attributeTitleBtn = NSMutableAttributedString(
            string: self.title,
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)]
        )
        let attributeTitleDisabledBtn = NSMutableAttributedString(
            string: self.title,
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray100, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)]
        )
    
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .purple700
        self.cornerRadius = 22.5
        self.borderWidth = 1
        self.borderColor = .purple700
        self.setAttributedTitle(attributeTitleBtn, for: .normal)
        self.setAttributedTitle(attributeTitleDisabledBtn, for: .disabled)
    }
    
}
