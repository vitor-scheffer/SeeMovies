import Foundation

public protocol I18nProtocol {
    var text: String { get }

    func text(with complement: String...) -> String
}

public final class I18n {
    public enum Onboarding: String, I18nProtocol {
        case title = "SMonboarding.title"
        

        public var text: String {
            return NSLocalizedString(self.rawValue.localized, comment: "")
        }

        public func text(with complement: String...) -> String {
            String(format: NSLocalizedString(self.text, comment: "%@"), arguments: complement)
        }
    }
    
    public enum SignIn: String, I18nProtocol {
        case title = "SMsign.in.title"
        

        public var text: String {
            return NSLocalizedString(self.rawValue.localized, comment: "")
        }

        public func text(with complement: String...) -> String {
            String(format: NSLocalizedString(self.text, comment: "%@"), arguments: complement)
        }
    }
    
    public enum SignUp: String, I18nProtocol {
        case title = "SMsign.up.title"
        

        public var text: String {
            return NSLocalizedString(self.rawValue.localized, comment: "")
        }

        public func text(with complement: String...) -> String {
            String(format: NSLocalizedString(self.text, comment: "%@"), arguments: complement)
        }
    }
    
    public enum Home: String, I18nProtocol {
        case continueWatching = "SMhome.continue.watching"
        case trending = "SMhome.trending"
        

        public var text: String {
            return NSLocalizedString(self.rawValue.localized, comment: "")
        }

        public func text(with complement: String...) -> String {
            String(format: NSLocalizedString(self.text, comment: "%@"), arguments: complement)
        }
    }
}
