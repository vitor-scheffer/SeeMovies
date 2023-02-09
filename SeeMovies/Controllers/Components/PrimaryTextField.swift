//
//  PrimaryTextField.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

class PrimaryTextField: UITextField {
    
    var placeholderText: String = ""
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        self.placeholderText = placeholder
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var iconAlertView: UIImageView = {
        let iconAlertView = UIImageView()
        
        iconAlertView.translatesAutoresizingMaskIntoConstraints = false
        iconAlertView.isHidden = true
        iconAlertView.image = UIImage(named: "icon-warning")
        return iconAlertView
    }()
    
    lazy var placeholderLabel: UILabel = {
        let placeholderLabel = UILabel()
        
        placeholderLabel.setTextPlaceholderLabel(textFieldLabel: placeholderText)
        placeholderLabel.isHidden = true
        return placeholderLabel
    }()
    
    lazy var constraintTopPlaceholderLabel: NSLayoutConstraint = {
        let constraintTop = placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 23)
        
        return constraintTop
    }()
    
    lazy var validationErrorLabel: UILabel = {
        let errorLabel = UILabel()
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        errorLabel.textColor = .red
        return errorLabel
    }()
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 15, left: 18, bottom: 0, right: 60))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 60))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 15, left: 18, bottom: 0, right: 60))
    }
}

extension PrimaryTextField: ViewCode {

    func buildHierarchy() {
        self.addSubview(placeholderLabel)
        self.addSubview(iconAlertView)
        self.addSubview(validationErrorLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 60),
            
            constraintTopPlaceholderLabel,
            placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            
            iconAlertView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconAlertView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            validationErrorLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 4),
            validationErrorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18)
            
        ])
    }
    
    func applyAdditionalChanges() {
        
        let fieldAttributes : [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.gray100
        ]
        let attributePlaceholderField = NSMutableAttributedString(
            string: self.placeholderText,
            attributes: fieldAttributes
        )
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderWidth = 1
        self.cornerRadius = 8
        self.borderColor = .white
        self.attributedPlaceholder = attributePlaceholderField
        self.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.textColor = .white
    }
}
