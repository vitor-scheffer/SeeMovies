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
