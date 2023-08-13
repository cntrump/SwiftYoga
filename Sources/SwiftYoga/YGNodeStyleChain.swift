
import Foundation
import yoga

extension YGNodeStyle {

    @discardableResult @inlinable
    public func direction(_ value: YGDirection) -> Self {
        direction = value
        return self
    }

    @discardableResult @inlinable
    public func flexDirection(_ value: YGFlexDirection) -> Self {
        flexDirection = value
        return self
    }

    @discardableResult @inlinable
    public func justifyContent(_ value: YGJustify) -> Self {
        justifyContent = value
        return self
    }

    @discardableResult @inlinable
    public func alignContent(_ value: YGAlign) -> Self {
        alignContent = value
        return self
    }

    @discardableResult @inlinable
    public func alignItems(_ value: YGAlign) -> Self {
        alignItems = value
        return self
    }

    @discardableResult @inlinable
    public func alignSelf(_ value: YGAlign) -> Self {
        alignSelf = value
        return self
    }

    @discardableResult @inlinable
    public func position(_ value: YGPositionType) -> Self {
        position = value
        return self
    }

    @discardableResult @inlinable
    public func flexWrap(_ value: YGWrap) -> Self {
        flexWrap = value
        return self
    }

    @discardableResult @inlinable
    public func overflow(_ value: YGOverflow) -> Self {
        overflow = value
        return self
    }

    @discardableResult @inlinable
    public func display(_ value: YGDisplay) -> Self {
        display = value
        return self
    }

    @discardableResult @inlinable
    public func flex(_ value: CGFloat) -> Self {
        flex = value
        return self
    }

    @discardableResult @inlinable
    public func flexGrow(_ value: CGFloat) -> Self {
        flexGrow = value
        return self
    }

    @discardableResult @inlinable
    public func flexShrink(_ value: CGFloat) -> Self {
        flexShrink = value
        return self
    }

    @discardableResult @inlinable
    public func flexBasis(_ value: YGValue) -> Self {
        flexBasis = value
        return self
    }
}

extension YGNodeStyle {

    @discardableResult @inlinable
    public func left(_ value: YGValue) -> Self {
        left = value
        return self
    }

    @discardableResult @inlinable
    public func top(_ value: YGValue) -> Self {
        top = value
        return self
    }

    @discardableResult @inlinable
    public func right(_ value: YGValue) -> Self {
        right = value
        return self
    }

    @discardableResult @inlinable
    public func bottom(_ value: YGValue) -> Self {
        bottom = value
        return self
    }
}

extension YGNodeStyle {

    @discardableResult @inlinable
    public func marginLeft(_ value: YGValue) -> Self {
        marginLeft = value
        return self
    }

    @discardableResult @inlinable
    public func marginTop(_ value: YGValue) -> Self {
        marginTop = value
        return self
    }

    @discardableResult @inlinable
    public func marginRight(_ value: YGValue) -> Self {
        marginRight = value
        return self
    }

    @discardableResult @inlinable
    public func marginBottom(_ value: YGValue) -> Self {
        marginBottom = value
        return self
    }
}

extension YGNodeStyle {

    @discardableResult @inlinable
    public func paddingLeft(_ value: YGValue) -> Self {
        paddingLeft = value
        return self
    }

    @discardableResult @inlinable
    public func paddingTop(_ value: YGValue) -> Self {
        paddingTop = value
        return self
    }

    @discardableResult @inlinable
    public func paddingRight(_ value: YGValue) -> Self {
        paddingRight = value
        return self
    }

    @discardableResult @inlinable
    public func paddingBottom(_ value: YGValue) -> Self {
        paddingBottom = value
        return self
    }
}

extension YGNodeStyle {

    @discardableResult @inlinable
    public func borderLeft(_ value: CGFloat) -> Self {
        borderLeft = value
        return self
    }

    @discardableResult @inlinable
    public func borderTop(_ value: CGFloat) -> Self {
        borderTop = value
        return self
    }

    @discardableResult @inlinable
    public func borderRight(_ value: CGFloat) -> Self {
        borderRight = value
        return self
    }

    @discardableResult @inlinable
    public func borderBottom(_ value: CGFloat) -> Self {
        borderBottom = value
        return self
    }
}

extension YGNodeStyle {

    @discardableResult @inlinable
    public func gapColumn(_ value: CGFloat) -> Self {
        setGap(value, for: .column)
        return self
    }

    @discardableResult @inlinable
    public func gapRow(_ value: CGFloat) -> Self {
        setGap(value, for: .row)
        return self
    }
}

extension YGNodeStyle {

    @discardableResult @inlinable
    public func width(_ value: YGValue) -> Self {
        width = value
        return self
    }

    @discardableResult @inlinable
    public func minWidth(_ value: YGValue) -> Self {
        minWidth = value
        return self
    }

    @discardableResult @inlinable
    public func maxWidth(_ value: YGValue) -> Self {
        maxWidth = value
        return self
    }

    @discardableResult @inlinable
    public func height(_ value: YGValue) -> Self {
        height = value
        return self
    }

    @discardableResult @inlinable
    public func minHeight(_ value: YGValue) -> Self {
        minHeight = value
        return self
    }

    @discardableResult @inlinable
    public func maxHeight(_ value: YGValue) -> Self {
        maxHeight = value
        return self
    }
}

extension YGNodeStyle {

    @discardableResult @inlinable
    public func aspectRatio(_ value: CGFloat) -> Self {
        aspectRatio = value
        return self
    }
}
