//
//  SMLabel.swift
//
//
//  Created by Vitor Scheffer on 25/10/23.
//

import UIKit

public final class SMLabel: UILabel {

    private let fontType: SMFont.FontType
    private var style: Style?
    
    public init(
        _ fontType: SMFont.FontType = .regular14,
        textColor: UIColor = .black,
        alignment: NSTextAlignment = .left,
        numberOfLines: Int = 0
    ) {
        self.fontType = fontType
        super.init(frame: .zero)
        self.textAlignment = alignment
        self.textColor = textColor.withAlphaComponent(alpha)
        self.numberOfLines = numberOfLines
        self.font = SMFont.font(fontType: fontType)
    }

    public convenience init(
        _ style: Style,
        textColor: UIColor? = nil,
        alignment: NSTextAlignment = .left,
        numberOfLines: Int = 0
    ) {
        var attributes: (SMFont.FontType, UIColor)
        switch style {
        case .callToActionSmall: attributes = SMLabelHelper.setupCallToAction(style)
        case .body, .bodyInverse, .bodySmall, .bodySmallInverse,
             .bodySmaller, .bodySmallerInverse: attributes = SMLabelHelper.setupBody(style)
        case .heading1, .heading2, .heading3, .heading4,
             .heading1Inverse, .heading2Inverse,
             .heading3Inverse, .heading4Inverse: attributes = SMLabelHelper.setupHeading(style)
        case .caption, .captionSmall, .captionInverse, .captionSmallInverse: attributes = SMLabelHelper.setupCaption(style)
        case .inputSmall: attributes = (.regular14, .black)
        case .labelSmall: attributes = (.regular12, .black)
        case .passwordDisplay: attributes = (.medium32, .black)
        }
        
        self.init(
            attributes.0,
            textColor: textColor ?? attributes.1,
            alignment: alignment,
            numberOfLines: numberOfLines
        )
        self.style = style
    }

    public override var text: String? {
        get { attributedText?.string }
        set { setupStyle(newValue) }
    }
    
    private func setupStyle(_ value: String?) {
        switch style {
        case .heading1, .heading1Inverse:
            setupParagraphStyle(value: value, lineHeight: 1.05)
        case .heading2, .heading2Inverse:
            setupParagraphStyle(value: value, lineHeight: 1.09)
        case .heading3, .heading3Inverse, .body, .bodyInverse, .bodySmaller, .bodySmallerInverse:
            setupParagraphStyle(value: value, lineHeight: 1.26)
        case .heading4, .heading4Inverse, .bodySmall, .bodySmallInverse:
            setupParagraphStyle(value: value, lineHeight: 1.20)
        case .caption, .captionInverse:
            setupParagraphStyle(value: value?.uppercased(), lineHeight: 1.29)
        case .captionSmall, .captionSmallInverse:
            setupParagraphStyle(value: value?.uppercased(), lineHeight: 1.16)
        case .passwordDisplay:
            setupDisplayPasswordStyle(value: value, lineHeight: 1.22, spacing: 2.96)
        default:
            setupParagraphStyle(value: value, lineHeight: 1.0)
        }
    }
    
    private func setupParagraphStyle(value: String?, lineHeight: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.alignment = self.textAlignment
        attributedText = NSMutableAttributedString(
            string: value ?? "",
            attributes: [.paragraphStyle: paragraphStyle]
        )
    }
    
    private func setupDisplayPasswordStyle(value: String?, lineHeight: CGFloat, spacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.alignment = self.textAlignment
        attributedText = NSMutableAttributedString(
            string: value ?? "",
            attributes: [.paragraphStyle: paragraphStyle, .kern: spacing]
        )
    }
    
    public enum Style: String, CaseIterable {
        case heading1
        case heading2
        case heading3
        case heading4
        case body
        case bodySmall
        case bodySmaller
        case caption
        case captionSmall
        case heading1Inverse
        case heading2Inverse
        case heading3Inverse
        case heading4Inverse
        case bodyInverse
        case bodySmallInverse
        case bodySmallerInverse
        case captionInverse
        case captionSmallInverse
        case inputSmall
        case callToActionSmall
        case labelSmall
        case passwordDisplay
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
}

private class SMLabelHelper {
    
    static func setupCallToAction(_ style: SMLabel.Style) -> (SMFont.FontType, UIColor) {
        switch style {
        case .callToActionSmall: return (.bold14, .black)
        default: return (.regular14, .black)
        }
    }

    static func setupHeading(_ style: SMLabel.Style) -> (SMFont.FontType, UIColor) {
        switch style {
        case .heading1: return (.regular24, .black)
        case .heading2: return (.regular20, .black)
        case .heading3: return (.bold16, .black)
        case .heading4: return (.medium16, .black)
        case .heading1Inverse: return (.regular24, .white)
        case .heading2Inverse: return (.regular20, .white)
        case .heading3Inverse: return (.bold16, .white)
        case .heading4Inverse: return (.medium16, .white)
        default: return (.regular14, .black)
        }
    }

    static func setupBody(_ style: SMLabel.Style) -> (SMFont.FontType, UIColor) {
        switch style {
        case .body: return (.regular16, .black)
        case .bodySmall: return (.regular14, .black)
        case .bodySmaller: return (.regular12, .black)
        case .bodyInverse: return (.regular16, .white)
        case .bodySmallInverse: return (.regular14, .white)
        case .bodySmallerInverse: return (.regular12, .white)
        default: return (.regular14, .black)
        }
    }

    static func setupCaption(_ style: SMLabel.Style) -> (SMFont.FontType, UIColor) {
        switch style {
        case .caption: return (.regular13, .black)
        case .captionSmall: return (.regular11, .black)
        case .captionInverse: return (.regular14, .white.withAlphaComponent(0.4))
        case .captionSmallInverse: return (.regular11, .white.withAlphaComponent(0.4))
        default: return (.regular14, .black)
        }
    }
}
