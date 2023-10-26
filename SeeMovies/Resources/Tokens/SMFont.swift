//
//  SMFont.swift
//
//
//  Created by Vitor Scheffer on 25/10/23.
//

import UIKit

public class SMFont: UIFont {

    public enum FontType: String {
        case black12, black14, black16
        case medium12, medium14, medium16, medium24, medium32
        case regular10, regular11, regular12, regular13, regular14, regular16, regular20, regular24
        case semiBold12, semiBold14, semiBold16
        case bold12, bold14, bold16, bold20, bold24, bold32, bold42, bold64
        case extraBold12, extraBold14, extraBold16
        case extraLight12, extraLight14, extraLight16
        case light12, light14, light16
        case thin12, thin14, thin16
    }
    
    public static func black(size: CGFloat = 14) -> UIFont? {
        return setupFont(font: UIFont.systemFont(ofSize: size, weight: .black), size: size)
    }

    public static func bold(size: CGFloat = 14) -> UIFont? {
        return setupFont(font: UIFont.systemFont(ofSize: size, weight: .bold), size: size)
    }

    public static func semiBold(size: CGFloat = 14) -> UIFont? {
        return setupFont(font: UIFont.systemFont(ofSize: size, weight: .semibold), size: size)
    }

    public static func extraBold(size: CGFloat = 14) -> UIFont? {
        return setupFont(font: UIFont.systemFont(ofSize: size, weight: .heavy), size: size)
    }

    public static func light(size: CGFloat = 14) -> UIFont? {
        return setupFont(font: UIFont.systemFont(ofSize: size, weight: .light), size: size)
    }

    public static func extraLight(size: CGFloat = 14) -> UIFont? {
        return setupFont(font: UIFont.systemFont(ofSize: size, weight: .ultraLight), size: size)
    }
    
    public static func medium(size: CGFloat = 14) -> UIFont? {
        return setupFont(font: UIFont.systemFont(ofSize: size, weight: .medium), size: size)
    }

    public static func regular(size: CGFloat = 14) -> UIFont? {
        return setupFont(font: UIFont.systemFont(ofSize: size, weight: .regular), size: size)
    }

    public static func thin(size: CGFloat = 14) -> UIFont? {
        return setupFont(font: UIFont.systemFont(ofSize: size, weight: .thin), size: size)
    }

    static func setupFont(font: UIFont?, size: CGFloat) -> UIFont? {
        
        let straightSidedSixAndNine: [UIFontDescriptor.FeatureKey: Int] = [
            .featureIdentifier: kStylisticAlternativesType,
            .typeIdentifier: 2
        ]

        let `case`: [String: Any] = [
            "CTFeatureOpenTypeTag": "case",
            "CTFeatureOpenTypeValue": 1
        ]
        
        let ss01: [String: Any] = [
            "CTFeatureOpenTypeTag": "ss01",
            "CTFeatureOpenTypeValue": 1
        ]

        let salt: [String: Any] = [
            "CTFeatureOpenTypeTag": "salt",
            "CTFeatureOpenTypeValue": 1
        ]

        if let descriptor = (font?.fontDescriptor.addingAttributes([.featureSettings: [straightSidedSixAndNine, `case`, ss01, salt] as [Any]])) {
            
            return UIFont(descriptor: descriptor, size: size)
        }

        return nil
    }

}

extension SMFont {
    
    public static func font(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .black12, .black14, .black16:
            return blackFont(fontType: fontType)
        case .medium12, .medium14, .medium16, .medium24, .medium32:
            return mediumFont(fontType: fontType)
        case .regular10, .regular11, .regular12, .regular13, .regular14, .regular16, .regular20, .regular24:
            return regularFont(fontType: fontType)
        case .semiBold12, .semiBold14, .semiBold16:
            return semiBoldFont(fontType: fontType)
        case .bold12, .bold14, .bold16, .bold20,
             .bold24, .bold32, .bold42, .bold64:
            return boldFont(fontType: fontType)
        case .extraBold12, .extraBold14, .extraBold16:
            return extraBoldFont(fontType: fontType)
        case .extraLight12, .extraLight14, .extraLight16:
            return extraLightFont(fontType: fontType)
        case .light12, .light14, .light16:
            return lightFont(fontType: fontType)
        case .thin12, .thin14, .thin16:
            return thinFont(fontType: fontType)
        }
    }

    private static func blackFont(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .black12: return SMFont.black(size: 12)
        case .black14: return SMFont.black(size: 14)
        case .black16: return SMFont.black(size: 16)
        default: return nil
        }
    }

    private static func mediumFont(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .medium12: return SMFont.medium(size: 12)
        case .medium14: return SMFont.medium(size: 14)
        case .medium16: return SMFont.medium(size: 16)
        case .medium24: return SMFont.medium(size: 24)
        case .medium32: return SMFont.medium(size: 32)
        default: return nil
        }
    }

    private static func regularFont(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .regular10: return SMFont.regular(size: 10)
        case .regular11: return SMFont.regular(size: 11)
        case .regular12: return SMFont.regular(size: 12)
        case .regular13: return SMFont.regular(size: 13)
        case .regular14: return SMFont.regular(size: 14)
        case .regular16: return SMFont.regular(size: 16)
        case .regular20: return SMFont.regular(size: 20)
        case .regular24: return SMFont.regular(size: 24)
        default: return nil
        }
    }

    private static func semiBoldFont(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .semiBold12: return SMFont.semiBold(size: 12)
        case .semiBold14: return SMFont.semiBold(size: 14)
        case .semiBold16: return SMFont.semiBold(size: 16)
        default: return nil
        }
    }

    private static func boldFont(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .bold12: return SMFont.bold(size: 12)
        case .bold14: return SMFont.bold(size: 14)
        case .bold16: return SMFont.bold(size: 16)
        case .bold20: return SMFont.bold(size: 20)
        case .bold24: return SMFont.bold(size: 24)
        case .bold32: return SMFont.bold(size: 32)
        case .bold42: return SMFont.bold(size: 42)
        case .bold64: return SMFont.bold(size: 64)
        default: return nil
        }
    }

    private static func extraBoldFont(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .extraBold12: return SMFont.extraBold(size: 12)
        case .extraBold14: return SMFont.extraBold(size: 14)
        case .extraBold16: return SMFont.extraBold(size: 16)
        default: return nil
        }
    }

    private static func extraLightFont(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .extraLight12: return SMFont.extraLight(size: 12)
        case .extraLight14: return SMFont.extraLight(size: 14)
        case .extraLight16: return SMFont.extraLight(size: 16)
        default: return nil
        }
    }

    private static func lightFont(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .light12: return SMFont.light(size: 12)
        case .light14: return SMFont.light(size: 14)
        case .light16: return SMFont.light(size: 16)
        default: return nil
        }
    }

    private static func thinFont(fontType: SMFont.FontType) -> UIFont? {
        switch fontType {
        case .thin12: return SMFont.thin(size: 12)
        case .thin14: return SMFont.thin(size: 14)
        case .thin16: return SMFont.thin(size: 16)
        default: return nil
        }
    }
}
