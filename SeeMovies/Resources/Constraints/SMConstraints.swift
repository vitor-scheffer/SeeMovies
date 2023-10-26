import UIKit

public extension UIView {
    var smc: SMConstraints { return SMConstraints(view: self) }
}

public class SMConstraints {
    private weak var view: UIView?
    
    public var parentView: UIView? {
        return view?.superview
    }
    
    init(view: UIView) {
        self.view = view
    }
    
    @discardableResult
    public func addSubView(_ view: UIView) -> SMConstraints {
        self.view?.addSubviews(view)
        return view.smc
    }
    
    @discardableResult
    public func addSubViews(_ views: UIView..., closure: ([SMConstraints]) -> Void) -> SMConstraints {
        self.view?.addSubviews(views)
        closure(views.map {$0.smc})
        return self
    }
    
    @discardableResult
    public func setAlpha(_ value: CGFloat) -> SMConstraints {
        view?.alpha = value
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ size: CGFloat) -> SMConstraints {
        view?.layer.cornerRadius = size
        return self
    }
    
    @discardableResult
    public func setBackgroundColor(_ color: UIColor) -> SMConstraints {
        view?.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func top(_ spacing: CGFloat = 0) -> SMConstraints {
        view?.top(spacing: spacing, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func top(_ constraint: NSLayoutYAxisAnchor, _ spacing: CGFloat = 0) -> SMConstraints {
        view?.top(constraint, spacing: spacing, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func top(
        _ constraint: NSLayoutYAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        view?.top(constraint, spacing: spacing, isActive: isActive, priority: priority)
        return self
    }
    
    @discardableResult
    public func bottom(_ spacing: CGFloat = 0) -> SMConstraints {
        view?.bottom(spacing: spacing, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func bottom(_ constraint: NSLayoutYAxisAnchor, _ spacing: CGFloat = 0) -> SMConstraints {
        view?.bottom(constraint, spacing: spacing, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func bottom(
        _ constraint: NSLayoutYAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        view?.bottom(constraint, spacing: spacing, isActive: isActive, priority: priority)
        return self
    }
    
    @discardableResult
    public func leading(_ spacing: CGFloat = 0) -> SMConstraints {
        view?.leading(spacing: spacing, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func leading(_ constraint: NSLayoutXAxisAnchor, _ spacing: CGFloat = 0) -> SMConstraints {
        view?.leading(constraint, spacing: spacing, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func leadingEqualOrGreaterThan(_ constraint: NSLayoutXAxisAnchor, _ spacing: CGFloat = 0) -> SMConstraints {
        view?.leadingAnchor.constraint(greaterThanOrEqualTo: constraint,
                                       constant: spacing).isActive = true
        return self
    }
    
    @discardableResult
    public func leading(
        _ constraint: NSLayoutXAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        view?.leading(
            constraint,
            spacing: spacing,
            isActive: isActive,
            priority: priority
        )
        return self
    }
    
    @discardableResult
    public func trailing(_ spacing: CGFloat = 0) -> SMConstraints {
        view?.trailing(spacing: spacing, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func trailing(_ constraint: NSLayoutXAxisAnchor, _ spacing: CGFloat = 0) -> SMConstraints {
        view?.trailing(constraint, spacing: spacing, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func trailing(
        _ constraint: NSLayoutXAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        
        view?.trailing(
            constraint,
            spacing: spacing,
            isActive: isActive,
            priority: priority
        )
        return self
    }
    
    @discardableResult
    public func trailingEqualOrGreaterThan(_ constraint: NSLayoutXAxisAnchor, _ spacing: CGFloat = 0) -> SMConstraints {
        view?.trailingAnchor.constraint(greaterThanOrEqualTo: constraint,
                                       constant: -spacing).isActive = true
        return self
    }
    
    @discardableResult
    public func height(_ size: CGFloat = 0) -> SMConstraints {
        view?.height(size, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func heightEqualOrGreaterThan(_ size: CGFloat = 0) -> SMConstraints {
        view?.heightAnchor.constraint(greaterThanOrEqualToConstant: size).isActive = true
        return self
    }
    
    @discardableResult
    public func height(
        _ size: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        view?.height(size, isActive: isActive, priority: priority)
        return self
    }
    
    @discardableResult
    public func height(_ constraint: NSLayoutDimension? = nil) -> SMConstraints {
        view?.height(constraint, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func height(
        _ constraint: NSLayoutDimension? = nil,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        view?.height(constraint, isActive: isActive, priority: priority)
        return self
    }
    
    @discardableResult
    public func width(_ constraint: NSLayoutDimension? = nil) -> SMConstraints {
        view?.width(constraint, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func width(
        _ constraint: NSLayoutDimension? = nil,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        view?.width(constraint, isActive: isActive, priority: priority)
        return self
    }
    
    @discardableResult
    public func width(_ size: CGFloat = 0) -> SMConstraints {
        view?.width(size, isActive: true, priority: .required)
        return self
    }
    
    @discardableResult
    public func width(
        _ size: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        view?.width(size, isActive: isActive, priority: priority)
        return self
    }
    
    @discardableResult
    public func centerX(
        _ constraint: NSLayoutXAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        view?.centerX(constraint, spacing: spacing, isActive: isActive, priority: priority)
        return self
    }
    
    @discardableResult
    public func centerY(
        _ constraint: NSLayoutYAxisAnchor? = nil,
        spacing: CGFloat = 0,
        isActive: Bool = true,
        priority: UILayoutPriority = .required
    ) -> SMConstraints {
        view?.centerY(constraint, spacing: spacing, isActive: isActive, priority: priority)
        return self
    }
}
