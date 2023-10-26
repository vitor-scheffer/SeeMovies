//
//  File.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        } set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        } set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = self.layer.borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        } set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

public extension UIView {
    func addLoading() {
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.tag = 101
        self.addSubview(blurEffectView)
        
        let activityIndicator = UIActivityIndicatorView()
        
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .whiteLarge
        }
        
        activityIndicator.color = UIColor.purple700
        activityIndicator.frame = self.bounds
        activityIndicator.startAnimating()
        activityIndicator.tag = 202
        self.addSubview(activityIndicator)
    }
    
    func removeLoading() {
        self.subviews.forEach { view in
            if view.tag == 101 || view.tag == 202 {
                view.removeFromSuperview()
            }
        }
    }
}

public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        addSubviews(subviews, constraints: true)
    }
    
    func addSubview(_ subview: UIView, constraints: Bool = true) {
        
        subview.translatesAutoresizingMaskIntoConstraints = !constraints
        addSubview(subview)
    }
    
    func addSubviews(_ subviews: [UIView], constraints: Bool = true) {
        
        for subview in subviews {
            subview.translatesAutoresizingMaskIntoConstraints = !constraints
            addSubview(subview)
        }
    }
}

extension UILabel {
    func setTextPlaceholderLabel(textFieldLabel: String) {
        let textAttributes : [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12, weight: .regular),
            .foregroundColor: UIColor.white
        ]
        let attributeTextFieldLabel = NSMutableAttributedString(
            string: textFieldLabel,
            attributes: textAttributes
        )
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isHidden = true
        self.attributedText = attributeTextFieldLabel
    }
}

extension String {
    var localized: String { NSLocalizedString(self, bundle: .main, comment: "") }
    
    func localized(with arguments: String...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}

extension UIImageView {
    func setImage(_ image: UIImage) {
        self.image = image
        self.contentMode = .scaleAspectFit
    }
}

public extension UIView {
    @discardableResult
    func top(
        _ constraint: NSLayoutYAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        
        guard let superview = superview else { return nil }
        let constraint = constraint ?? superview.topAnchor
        
        let topAnchor = topAnchor.constraint(equalTo: constraint, constant: spacing)
        topAnchor.priority = priority
        topAnchor.isActive = isActive
        return topAnchor
    }
    
    @discardableResult
    func bottom(
        _ constraint: NSLayoutYAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        
        guard let superview = superview else { return nil }
        let constraint = constraint ?? superview.bottomAnchor
        let bottomAnchor = bottomAnchor.constraint(equalTo: constraint, constant: -spacing)
        bottomAnchor.priority = priority
        bottomAnchor.isActive = isActive
        return bottomAnchor
    }
    
    @discardableResult
    func leading(
        _ constraint: NSLayoutXAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        
        guard let superview = superview else { return nil }
        let constraint = constraint ?? superview.leadingAnchor
        let leadingAnchor = leadingAnchor.constraint(equalTo: constraint, constant: spacing)
        leadingAnchor.priority = priority
        leadingAnchor.isActive = isActive
        return leadingAnchor
    }
    
    @discardableResult
    func trailing(
        _ constraint: NSLayoutXAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        
        guard let superview = superview else { return nil }
        let constraint = constraint ?? superview.trailingAnchor
        let trailingAnchor = trailingAnchor.constraint(equalTo: constraint, constant: -spacing)
        trailingAnchor.priority = priority
        trailingAnchor.isActive = isActive
        return trailingAnchor
    }
    
    @discardableResult
    func height(
        _ constraint: NSLayoutDimension? = nil,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        let constraint = constraint ?? superview.heightAnchor
        let heightAnchor = heightAnchor.constraint(equalTo: constraint)
        heightAnchor.priority = priority
        heightAnchor.isActive = isActive
        return heightAnchor
    }
    
    @discardableResult
    func height(
        _ size: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let heightAnchor = heightAnchor.constraint(equalToConstant: size)
        heightAnchor.priority = priority
        heightAnchor.isActive = isActive
        return heightAnchor
    }
    
    @discardableResult
    func width(
        _ constraint: NSLayoutDimension? = nil,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        let constraint = constraint ?? superview.heightAnchor
        let widthAnchor = widthAnchor.constraint(equalTo: constraint)
        widthAnchor.priority = priority
        widthAnchor.isActive = isActive
        return widthAnchor
    }
    
    @discardableResult
    func width(
        _ size: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let widthAnchor = widthAnchor.constraint(equalToConstant: size)
        widthAnchor.priority = priority
        widthAnchor.isActive = isActive
        return widthAnchor
    }
    
    @discardableResult
    func centerX(
        _ constraint: NSLayoutXAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        
        guard let superview = superview else { return nil }
        let constraint = constraint ?? superview.centerXAnchor
        let centerXAnchor = centerXAnchor.constraint(equalTo: constraint, constant: spacing)
        centerXAnchor.priority = priority
        centerXAnchor.isActive = isActive
        return centerXAnchor
    }
    
    @discardableResult
    func centerY(
        _ constraint: NSLayoutYAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        
        guard let superview = superview else { return nil }
        let constraint = constraint ?? superview.centerYAnchor
        let centerYAnchor = centerYAnchor.constraint(equalTo: constraint, constant: spacing)
        centerYAnchor.priority = priority
        centerYAnchor.isActive = isActive
        return centerYAnchor
    }
    
    func setSize(width: CGFloat, height: CGFloat) {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ])
    }
}
