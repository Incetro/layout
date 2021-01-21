//
//  Constraint.swift
//  Layout
//
//  Created by Alexander Lezya on 21.01.2021.
//

import UIKit

// MARK: - ConstraintAngle

public struct ConstraintAngle {

    // MARK: - Properties

    /// First part of angle
    private let first: NSLayoutAnchor<NSLayoutXAxisAnchor>

    /// Second part of angle
    private let second: NSLayoutAnchor<NSLayoutYAxisAnchor>

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameters:
    ///   - first: first part of angle
    ///   - second: second part of angle
    public init(first: NSLayoutAnchor<NSLayoutXAxisAnchor>, second: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        self.first = first
        self.second = second
    }

    // MARK: - Useful methods

    /// Connect current angle to other angle
    ///
    /// - Parameters:
    ///   - other: target angle
    ///   - offset: offset for constraints
    public func connect(to other: ConstraintAngle, withOffset offset: CGFloat = 0) {
        first.constraint(equalTo: other.first, constant: offset).isActive = true
        second.constraint(equalTo: other.second, constant: offset).isActive = true
    }
}

// MARK: - Constraint

public struct Constraint<T: AnyObject> {

    // MARK: - Properties

    /// Wrapped constraint
    private let constraint: NSLayoutAnchor<T>

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter constraint: wrapped constraint
    public init(constraint: NSLayoutAnchor<T>) {
        self.constraint = constraint
    }

    // MARK: - Useful methods

    /// Connect current constraint to other constraint
    ///
    /// - Parameters:
    ///   - other: target constraint
    ///   - offset: constraint's offset
    @discardableResult public func connect(to other: Constraint<T>, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = self.constraint.constraint(equalTo: other.constraint, constant: offset)
        constraint.isActive = true
        return constraint
    }

    /// Connect current constraint to other constraint
    ///
    /// - Parameters:
    ///   - other: target constraint
    ///   - offset: constraint's offset
    @discardableResult public func greater(than other: Constraint<T>, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = self.constraint.constraint(greaterThanOrEqualTo: other.constraint, constant: offset)
        constraint.isActive = true
        return constraint
    }

    /// Connect current constraint to other constraint
    ///
    /// - Parameters:
    ///   - other: target constraint
    ///   - offset: constraint's offset
    @discardableResult public func less(than other: Constraint<T>, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = self.constraint.constraint(lessThanOrEqualTo: other.constraint, constant: offset)
        constraint.isActive = true
        return constraint
    }

    /// Connect current constraint to other constraint using MetaConstraint
    ///
    /// - Parameter constraint: MetaConstraint instance
    public func connect(to constraint: MetaConstraint<T>) {
        connect(to: constraint.constraint, withOffset: constraint.constant)
    }
}

// MARK: - MetaConstraint

public struct MetaConstraint<T: AnyObject> {

    // MARK: - Properties

    /// Wrapped constraint
    public let constraint: Constraint<T>

    /// Wrapped constraint's offset
    public let constant: CGFloat
}

/// Common `+` operator for making constraints with offsets
///
/// - Parameters:
///   - lhs: constraint which should contain the given offset
///   - offset: offset for the given constraint
/// - Returns: MetaConstraint instance
public func + <T>(lhs: Constraint<T>, offset: CGFloat) -> MetaConstraint<T> {
    MetaConstraint(constraint: lhs, constant: offset)
}

/// Common `-` operator for making constraints with offsets
///
/// - Parameters:
///   - lhs: constraint which should contain the given offset
///   - offset: offset for the given constraint
/// - Returns: MetaConstraint instance
public func - <T>(lhs: Constraint<T>, offset: CGFloat) -> MetaConstraint<T> {
    MetaConstraint(constraint: lhs, constant: -offset)
}

// MARK: - DimensionConstraint

public struct DimensionConstraint {

    // MARK: - Properties

    /// Wrapped constraint
    private let constraint: NSLayoutDimension

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter constraint: wrapped constraint
    public init(constraint: NSLayoutDimension) {
        self.constraint = constraint
    }

    // MARK: - Useful methods

    /// Set current constraint equal to other constraint
    ///
    /// - Parameters:
    ///   - other: target constraint
    ///   - multiplier: constraint's multiplier
    @discardableResult public func equal(to other: DimensionConstraint, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        let constraint = self.constraint.constraint(equalTo: other.constraint, multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }

    /// Set current constraint less than or equal to other constraint
    ///
    /// - Parameters:
    ///   - other: target constraint
    ///   - multiplier: constraint's multiplier
    @discardableResult public func lessThanOrEqual(to other: DimensionConstraint, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        let constraint = self.constraint.constraint(lessThanOrEqualTo: other.constraint, multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }

    /// Set current constraint less than or equal to some constant
    ///
    /// - Parameters:
    ///   - other: target constraint
    ///   - multiplier: constraint's multiplier
    @discardableResult public func lessThanOrEqual(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.constraint.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }

    /// Set current constraint greater than or equal to other constraint
    ///
    /// - Parameters:
    ///   - other: target constraint
    ///   - multiplier: constraint's multiplier
    @discardableResult public func greaterThanOrEqual(to other: DimensionConstraint, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        let constraint = self.constraint.constraint(greaterThanOrEqualTo: other.constraint, multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }

    /// Set current constraint greater than or equal to some constant
    ///
    /// - Parameters:
    ///   - constant: some constant
    @discardableResult public func greaterThanOrEqual(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.constraint.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }

    /// Set current constraint equal to some constant
    ///
    /// - Parameter constant: constraint's constant
    @discardableResult public func equal(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.constraint.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
}

