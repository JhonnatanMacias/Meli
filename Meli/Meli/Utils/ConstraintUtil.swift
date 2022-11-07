//
//  ConstraintUtil.swift
//  Meli
//
//  Created by Jhonnatan Macias on 31/10/22.
//

import Foundation
import UIKit

@objcMembers open class ConstraintUtil: NSObject {

    open class func pinAllSides(of view: UIView,
                                to otherView: UIView,
                                withMargins margins: UIEdgeInsets = UIEdgeInsets.zero) -> [NSLayoutConstraint] {

        var constraints = [NSLayoutConstraint]()

        constraints.append(pinTopOfView(view, toTopOfView: otherView, withMargin: margins.top))
        constraints.append(pinBottomOfView(view, toBottomOfView: otherView, withMargin: margins.bottom))
        constraints.append(pinLeftOfView(view, toLeftOfView: otherView, withMargin: margins.left))
        constraints.append(pinRightOfView(view, toRightOfView: otherView, withMargin: margins.right))

        return constraints
    }

    open class func pinTopOfView(_ view: UIView, toBottomOfView otherView: UIView) -> NSLayoutConstraint {
        return ConstraintUtil.pinTopOfView(view, toBottomOfView: otherView, withMargin: 0.0)
    }

    open class func pinTopOfView(
        _ view: UIView,
        toBottomOfView otherView: UIView,
        withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .top,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .bottom,
                                  multiplier: 1.0,
                                  constant: margin)
    }

    open class func pinMinTopOfView(
        _ view: UIView,
        toBottomOfView otherView: UIView,
        withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .top,
                                  relatedBy: .greaterThanOrEqual,
                                  toItem: otherView,
                                  attribute: .bottom,
                                  multiplier: 1.0,
                                  constant: margin)
    }

    open class func pinLeftOfView(_ view: UIView, toLeftOfView otherView: UIView) -> NSLayoutConstraint {
        return ConstraintUtil.pinLeftOfView(view, toLeftOfView: otherView, withMargin: 0.0)
    }

    open class func pinLeftOfView(
        _ view: UIView,
        toLeftOfView otherView: UIView,
        withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .left,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .left,
                                  multiplier: 1.0,
                                  constant: margin)
    }

    open class func pinRightToLeftOfView(_ view: UIView, toLeftOfView otherView: UIView) -> NSLayoutConstraint {
        return ConstraintUtil.pinRightToLeftOfView(view, toLeftOfView: otherView, withMargin: 0.0)
    }

    open class func pinRightToLeftOfView(
        _ view: UIView,
        toLeftOfView otherView: UIView,
        withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .right,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .left,
                                  multiplier: 1.0,
                                  constant: margin)
    }

    open class func pinLeftToRightOfView(_ view: UIView, toRightOfView otherView: UIView) -> NSLayoutConstraint {
        return ConstraintUtil.pinLeftToRightOfView(view, toRightOfView: otherView, withMargin: 0.0)
    }

    open class func pinLeftToRightOfView(
        _ view: UIView,
        toRightOfView otherView: UIView,
        withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .left,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .right,
                                  multiplier: 1.0,
                                  constant: margin)
    }

    open class func pinRightOfView(_ view: UIView, toRightOfView otherView: UIView) -> NSLayoutConstraint {
        return ConstraintUtil.pinRightOfView(view, toRightOfView: otherView, withMargin: 0.0)
    }

    open class func pinRightOfView(
        _ view: UIView,
        toRightOfView otherView: UIView,
        withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .right,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .right,
                                  multiplier: 1.0,
                                  constant: margin)
    }

    open class func centerViewHorizontally(_ view: UIView, inContainingView container: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .centerX,
                                  relatedBy: .equal,
                                  toItem: container,
                                  attribute: .centerX,
                                  multiplier: 1.0,
                                  constant: 0.0)
    }

    open class func centerViewVertically(_ view: UIView, inContainingView container: UIView, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .centerY,
                                  relatedBy: .equal,
                                  toItem: container,
                                  attribute: .centerY,
                                  multiplier: 1.0,
                                  constant: constant)
    }

    open class func pinBottomOfView(_ view: UIView, toBottomOfView otherView: UIView) -> NSLayoutConstraint {
        return ConstraintUtil.pinBottomOfView(view, toBottomOfView: otherView, withMargin: 0.0)
    }

    open class func pinBottomOfView(_ view: UIView,
                                    toBottomOfView otherView: UIView,
                                    withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .bottom,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .bottom,
                                  multiplier: 1.0,
                                  constant: margin)
    }


    open class func pinBottomToTopOfView(_ view: UIView, toTopOfView otherView: UIView) -> NSLayoutConstraint {
        return ConstraintUtil.pinBottomToTopOfView(view, toTopOfView: otherView, withMargin: 0.0)
    }

    open class func pinBottomToTopOfView(
        _ view: UIView,
        toTopOfView otherView: UIView,
        withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .bottom,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .top,
                                  multiplier: 1.0,
                                  constant: margin)
    }

    open class func pinTopToBottomOfView(_ view: UIView, toBottomOfView otherView: UIView) -> NSLayoutConstraint {
          return ConstraintUtil.pinTopToBottomOfView(view, toBottomOfView: otherView, withMargin: 0.0)
    }

    open class func pinTopToBottomOfView(_ view: UIView,
                                         toBottomOfView otherView: UIView,
                                         withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .top,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .bottom,
                                  multiplier: 1.0,
                                  constant: margin)
    }

    open class func pinTopOfView(_ view: UIView, toTopOfView otherView: UIView) -> NSLayoutConstraint {
        return ConstraintUtil.pinTopOfView(view, toTopOfView: otherView, withMargin: 0.0)
    }

 open class func pinTopOfView(_ view: UIView,
                              toTopOfView otherView: UIView,
                              withMargin margin: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .top,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .top,
                                  multiplier: 1.0,
                                  constant: margin)
    }

    @available(*, deprecated, message: "Use setConstantConstraintFor")
    open class func setConstantConstraintForView(
        _ view: UIView,
        attribute: NSLayoutConstraint.Attribute,
        constant: CGFloat) -> NSLayoutConstraint {
        return setConstantConstraintFor(view,
                                        attribute: attribute,
                                        constant: constant)
    }

    open class func setWidthOfView(_ view: UIView,
                                   toWidthOfView otherView: UIView?,
                                   multiplier: CGFloat = 1.0) -> NSLayoutConstraint {
        return ConstraintUtil.setWidthOfView(view, toWidthOfView: otherView, withMargin: 0.0, multiplier: multiplier)
    }

    open class func setWidth(_ view: UIView,
                             constant: CGFloat = 0,
                             multiplier: CGFloat = 1,
                             priority: UILayoutPriority? = UILayoutPriority(rawValue: 1000),
                             active: Bool? = true) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint(item: view,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.isActive = active!
        constraint.priority = priority!
        return constraint
    }

    open class func setWidthOfView(
        _ view: UIView,
        toWidthOfView otherView: UIView?,
        withMargin margin: CGFloat,
        multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .width,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .width,
                                  multiplier: multiplier,
                                  constant: margin)
    }

    open class func setHeight(_ height: CGFloat, toView view: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute(rawValue: 0)!,
                                  multiplier: 1.0, constant: height)
    }

    open class func setMaxHeight(_ height: CGFloat, toView view: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: .height, relatedBy: .lessThanOrEqual, toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute(rawValue: 0)!,
                                  multiplier: 1.0, constant: height)
    }

    open class func setMinHeight(_ height: CGFloat, toView view: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute(rawValue: 0)!,
                                  multiplier: 1.0, constant: height)
    }

    open class func setMinBottom(_ height: CGFloat, toView view: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute(rawValue: 0)!,
                                  multiplier: 1.0, constant: height)
    }

    open class func setWidth(_ width: CGFloat, toView view: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute(rawValue: 0)!,
                                  multiplier: 1.0, constant: width)
    }

    open class func setHeightOfView(_ view: UIView,
                                    toHeightOfView otherView: UIView?,
                                    multiplier: CGFloat = 1.0) -> NSLayoutConstraint {
        return ConstraintUtil.setHeightOfView(view, toHeightOfView: otherView, withMargin: 0.0, multiplier: multiplier)
    }

    open class func setMaxHeightOfView(_ view: UIView,
                                       height: CGFloat,
                                       priority: UILayoutPriority? = UILayoutPriority(rawValue: 1000)) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .lessThanOrEqual, toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute(rawValue: 0)!,
                                  multiplier: 1.0, constant: height)
        constraint.isActive = true
        constraint.priority = priority!

        return constraint
    }

    open class func setHeightOfView(
        _ view: UIView,
        toHeightOfView otherView: UIView?,
        withMargin margin: CGFloat,
        multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: .height,
                                  relatedBy: .equal,
                                  toItem: otherView,
                                  attribute: .height,
                                  multiplier: multiplier,
                                  constant: margin)
    }

    open class func autolayoutForView(_ view: UIView,
                                      constraints: [String],
                                      views: [String: UIView],
                                      metrics: [String: Any]?) {

        #if DEBUG
        // For development check to make sure autoresizingMasks are turned off
        for view in views.values {
            assert(!view.translatesAutoresizingMaskIntoConstraints, "Please turn off autoresizingMask")
        }

        #endif

        for constraintsWithVisualFormat in constraints {
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: constraintsWithVisualFormat,
                                                               options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                               metrics: metrics,
                                                               views: views))
        }
    }

    open class func setConstantConstraintFor(
        _ view: UIView,
        attribute: NSLayoutConstraint.Attribute,
        constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: view,
            attribute: attribute,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: constant)

        view.addConstraint(constraint)
        return constraint
    }
}

/// Describes a type that can be constrained by a UIKit layout.
///
/// You should not need to implement this protocol yourself; conformances for `UIView` and `UILayoutGuide` are provided.
public protocol LayoutAnchorable {
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var heightAnchor: NSLayoutDimension { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
}

extension UIView: LayoutAnchorable {}
extension UILayoutGuide: LayoutAnchorable {}


public extension LayoutAnchorable {

    /// Creates constraints that pin a set of edges to another view.
    ///
    /// The constraints have priority `UILayoutPriority.required` by default. Use the priority
    /// parameter to change it to a different priority.
    ///
    /// - Parameter other: The view to pin this view to.
    /// - Parameter edges: A set of edges to pin this view to. The default value is `LayoutConstrainingEdges.all`.
    /// - Parameter insets: Edge insets. Edges that are constrained
    ///  (by passing a LayoutConstrainingEdges set) are constrained
    ///                     relative to the insets. Default values are `0`.
    /// - Parameter priority: UILayoutPriority for all constraints that will be set. Default value is
    /// `UILayoutPriority.required`.
    ///
    /// - Returns: A `LayoutConstraining` instance that can be passed to `NSLayoutConstraint.activate()`
    func constraints(
        pinningTo other: LayoutAnchorable,
        edges: LayoutConstrainingEdges = .all,
        insets: LayoutConstrainingInsets = 0,
        priority: UILayoutPriority = .required)
        -> LayoutConstraining {
        [
            edges.contains(.top) ? topAnchor.constraint(equalTo: other.topAnchor, constant: insets.top) : nil,
            edges.contains(.leading) ? leadingAnchor.constraint(equalTo: other.leadingAnchor,
                                                                constant: insets.leading) : nil,
            edges.contains(.bottom) ? bottomAnchor.constraint(equalTo: other.bottomAnchor,
                                                              constant: -insets.bottom) : nil,
            edges.contains(.trailing) ? trailingAnchor.constraint(equalTo: other.trailingAnchor,
                                                                  constant: -insets.trailing) : nil
            ].map { $0?.with(priority: priority) }
    }
}

/// Constrainable view edges to be used with `LayoutConstraining`/`LayoutAnchorable` code.
public struct LayoutConstrainingEdges: OptionSet {
    private static let mask = 0b1111

    public let rawValue: Int

    public init(rawValue: Int) {
        assert(rawValue == 0 || Self.mask & rawValue != 0, "Invalid `LayoutConstrainingEdges.rawValue`: \(rawValue)")
        self.rawValue = rawValue
    }

    // The top edge of a view.
    public static let top = LayoutConstrainingEdges(rawValue: 0b0001)

    /// The leading edge of a view.
    public static let leading = LayoutConstrainingEdges(rawValue: 0b0010)

    /// The bottom edge of a view.
    public static let bottom = LayoutConstrainingEdges(rawValue: 0b0100)

    /// The trailing edge of a view.
    public static let trailing = LayoutConstrainingEdges(rawValue: 0b1000)

    /// All edges of a view.
    public static let all: LayoutConstrainingEdges = LayoutConstrainingEdges(rawValue: mask)

    /// The horizontal edges of a view, i.e. `[.leading, .trailing]`.
    public static let horizontal: LayoutConstrainingEdges = [.leading, .trailing]

    /// The vertical edges of a view, i.e. `[.top, bottom]`.
    public static let vertical: LayoutConstrainingEdges = [.top, .bottom]
}

public extension NSLayoutConstraint {
    /// Activates a collection of `LayoutConstraining` instances.
    static func activate(_ constrainers: [LayoutConstraining]) {
        activate(constrainers.reduce(into: [], { $1.appendConstraints(to: &$0) }))
    }

    /// Activates a collection of `LayoutConstraining` instances.
    static func activate(_ constrainers: LayoutConstraining...) {
        activate(constrainers)
    }

    /// Deactivates a collection of `LayoutConstraining` instances.
    static func deactivate(_ constrainers: [LayoutConstraining]) {
        deactivate(constrainers.reduce(into: [], { $1.appendConstraints(to: &$0) }))
    }

    /// Deactivates a collection of `LayoutConstraining` instances.
    static func deactivate(_ constrainers: LayoutConstraining...) {
        deactivate(constrainers)
    }
}

/// Describes a type that can be used to constrain the layout of a UIKit layout.
///
/// Typically you will not need to implement this protocol yourself; you will use the provided conformances.
///
/// Example:
/// ```
/// NSLayoutConstraint.activate(
///   activityIndicatorView.constraints(centeringIn: layoutMarginsGuide),
///   //...
/// )
/// ```
public protocol LayoutConstraining {
    /// Appends constraints to array `NSLayoutConstraint`
    /// - Parameter array: an array of `NSLayoutConstraint`
    func appendConstraints(to array: inout [NSLayoutConstraint])
    /// Activates single `LayoutConstraining` instance
    func activate()

    func deactivate()
}

public extension LayoutConstraining {
    func activate() {
        NSLayoutConstraint.activate(self)
    }

    func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
}

extension NSLayoutConstraint: LayoutConstraining {
    public func appendConstraints(to array: inout [NSLayoutConstraint]) {
        array.append(self)
    }
}

extension Array: LayoutConstraining where Element: LayoutConstraining {
    public func appendConstraints(to array: inout [NSLayoutConstraint]) {
        forEach { $0.appendConstraints(to: &array) }
    }
}

extension Optional: LayoutConstraining where Wrapped: LayoutConstraining {
    public func appendConstraints(to array: inout [NSLayoutConstraint]) {
        self?.appendConstraints(to: &array)
    }
}

public extension NSLayoutConstraint {

    /// A convenience method for changing the priority from `required` to `requiredCompliant`.
    func compliant() -> NSLayoutConstraint {
        assert(priority == .required)
        priority = .requiredCompliant
        return self
    }

    /// Sets the layout priority of `self` to the provided `priority` and returns `self`
    ///
    /// - Author: Jordan Perry
    /// - Parameter priority: layout priority to set `self` to
    /// - Returns: `self`
    func with(priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}

extension UILayoutPriority {
    /// A priority to use in place of `required`, for example when there is a need to tolerate being temporarily
    /// zero-sized.
    public static let requiredCompliant = UILayoutPriority.required.decreased

    /// Gets the next (whole number) priority higher than this one.
    public var increased: UILayoutPriority {
        return UILayoutPriority(rawValue: min(rawValue + 1, UILayoutPriority.required.rawValue))
    }

    /// Gets the next (whole number) priority lower than this one.
    public var decreased: UILayoutPriority {
        return UILayoutPriority(rawValue: max(0, rawValue - 1))
    }
}
