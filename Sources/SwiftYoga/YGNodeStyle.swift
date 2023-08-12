
import Foundation
import yoga

public class YGNodeStyle {

    weak var node: YGNode?

    init(node: YGNode) {
        self.node = node
    }
}

extension YGNode {

    public convenience init(config: YGConfig, styles block: (_ style: YGNodeStyle) -> Void) {
        self.init(config: config)
        block(style)
    }

    public func styles(block: (_ style: YGNodeStyle) -> Void) {
        block(style)
    }
}

extension YGNodeStyle {

    public var direction: YGDirection {
        get {
            guard let node = node else {
                return .inherit
            }

            return YGNodeStyleGetDirection(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetDirection(node.nodeRef, newValue)
        }
    }

    public var flexDirection: YGFlexDirection {
        get {
            guard let node = node else {
                return .column
            }

            return YGNodeStyleGetFlexDirection(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetFlexDirection(node.nodeRef, newValue)
        }
    }

    public var justifyContent: YGJustify {
        get {
            guard let node = node else {
                return .flexStart
            }

            return YGNodeStyleGetJustifyContent(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetJustifyContent(node.nodeRef, newValue)
        }
    }

    public var alignContent: YGAlign {
        get {
            guard let node = node else {
                return .flexStart
            }

            return YGNodeStyleGetAlignContent(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetAlignContent(node.nodeRef, newValue)
        }
    }

    public var alignItems: YGAlign {
        get {
            guard let node = node else {
                return .flexStart
            }

            return YGNodeStyleGetAlignItems(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetAlignItems(node.nodeRef, newValue)
        }
    }

    public var alignSelf: YGAlign {
        get {
            guard let node = node else {
                return .flexStart
            }

            return YGNodeStyleGetAlignSelf(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetAlignSelf(node.nodeRef, newValue)
        }
    }

    public var position: YGPositionType {
        get {
            guard let node = node else {
                return .static
            }

            return YGNodeStyleGetPositionType(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetPositionType(node.nodeRef, newValue)
        }
    }

    public var flexWrap: YGWrap {
        get {
            guard let node = node else {
                return .noWrap
            }

            return YGNodeStyleGetFlexWrap(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetFlexWrap(node.nodeRef, newValue)
        }
    }

    public var overflow: YGOverflow {
        get {
            guard let node = node else {
                return .visible
            }

            return YGNodeStyleGetOverflow(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetOverflow(node.nodeRef, newValue)
        }
    }

    public var display: YGDisplay {
        get {
            guard let node = node else {
                return .flex
            }

            return YGNodeStyleGetDisplay(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetDisplay(node.nodeRef, newValue)
        }
    }

    public var flex: CGFloat {
        get {
            guard let node = node else {
                return 0
            }

            return CGFloat(YGNodeStyleGetFlex(node.nodeRef))
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetFlex(node.nodeRef, Float(newValue))
        }
    }

    public var flexGrow: CGFloat {
        get {
            guard let node = node else {
                return 0
            }

            return CGFloat(YGNodeStyleGetFlexGrow(node.nodeRef))
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetFlexGrow(node.nodeRef, Float(newValue))
        }
    }

    public var flexShrink: CGFloat {
        get {
            guard let node = node else {
                return 0
            }

            return CGFloat(YGNodeStyleGetFlexShrink(node.nodeRef))
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetFlexShrink(node.nodeRef, Float(newValue))
        }
    }

    public var flexBasis: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetFlexBasis(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .auto:
                YGNodeStyleSetFlexBasisAuto(node.nodeRef)
            case .percent:
                YGNodeStyleSetFlexBasisPercent(node.nodeRef, newValue.value)
            case .point:
                YGNodeStyleSetFlexBasis(node.nodeRef, newValue.value)
            default:
                return
            }
        }
    }
}

extension YGNodeStyle {

    public var left: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetPosition(node.nodeRef, .left)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetPositionPercent(node.nodeRef, .left, newValue.value)
            case .point:
                YGNodeStyleSetPosition(node.nodeRef, .left, newValue.value)
            default:
                return
            }
        }
    }

    public var top: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetPosition(node.nodeRef, .top)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetPositionPercent(node.nodeRef, .top, newValue.value)
            case .point:
                YGNodeStyleSetPosition(node.nodeRef, .top, newValue.value)
            default:
                return
            }
        }
    }

    public var right: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetPosition(node.nodeRef, .right)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetPositionPercent(node.nodeRef, .right, newValue.value)
            case .point:
                YGNodeStyleSetPosition(node.nodeRef, .right, newValue.value)
            default:
                return
            }
        }
    }

    public var bottom: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetPosition(node.nodeRef, .bottom)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetPositionPercent(node.nodeRef, .bottom, newValue.value)
            case .point:
                YGNodeStyleSetPosition(node.nodeRef, .bottom, newValue.value)
            default:
                return
            }
        }
    }
}

extension YGNodeStyle {

    public var marginLeft: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetMargin(node.nodeRef, .left)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .auto:
                YGNodeStyleSetMarginAuto(node.nodeRef, .left)
            case .percent:
                YGNodeStyleSetMarginPercent(node.nodeRef, .left, newValue.value)
            case .point:
                YGNodeStyleSetMargin(node.nodeRef, .left, newValue.value)
            default:
                return
            }
        }
    }

    public var marginTop: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetMargin(node.nodeRef, .top)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .auto:
                YGNodeStyleSetMarginAuto(node.nodeRef, .top)
            case .percent:
                YGNodeStyleSetMarginPercent(node.nodeRef, .top, newValue.value)
            case .point:
                YGNodeStyleSetMargin(node.nodeRef, .top, newValue.value)
            default:
                return
            }
        }
    }

    public var marginRight: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetMargin(node.nodeRef, .right)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .auto:
                YGNodeStyleSetMarginAuto(node.nodeRef, .right)
            case .percent:
                YGNodeStyleSetMarginPercent(node.nodeRef, .right, newValue.value)
            case .point:
                YGNodeStyleSetMargin(node.nodeRef, .right, newValue.value)
            default:
                return
            }
        }
    }

    public var marginBottom: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetMargin(node.nodeRef, .bottom)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .auto:
                YGNodeStyleSetMarginAuto(node.nodeRef, .bottom)
            case .percent:
                YGNodeStyleSetMarginPercent(node.nodeRef, .bottom, newValue.value)
            case .point:
                YGNodeStyleSetMargin(node.nodeRef, .bottom, newValue.value)
            default:
                return
            }
        }
    }
}

extension YGNodeStyle {

    public var paddingLeft: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetPadding(node.nodeRef, .left)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetPaddingPercent(node.nodeRef, .left, newValue.value)
            case .point:
                YGNodeStyleSetPadding(node.nodeRef, .left, newValue.value)
            default:
                return
            }
        }
    }

    public var paddingTop: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetPadding(node.nodeRef, .top)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetPaddingPercent(node.nodeRef, .top, newValue.value)
            case .point:
                YGNodeStyleSetPadding(node.nodeRef, .top, newValue.value)
            default:
                return
            }
        }
    }

    public var paddingRight: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetPadding(node.nodeRef, .right)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetPaddingPercent(node.nodeRef, .right, newValue.value)
            case .point:
                YGNodeStyleSetPadding(node.nodeRef, .right, newValue.value)
            default:
                return
            }
        }
    }

    public var paddingBottom: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetPadding(node.nodeRef, .bottom)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetPaddingPercent(node.nodeRef, .bottom, newValue.value)
            case .point:
                YGNodeStyleSetPadding(node.nodeRef, .bottom, newValue.value)
            default:
                return
            }
        }
    }
}

extension YGNodeStyle {

    public var borderLeft: CGFloat {
        get {
            guard let node = node else {
                return 0
            }

            return CGFloat(YGNodeStyleGetBorder(node.nodeRef, .left))
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetBorder(node.nodeRef, .left, Float(newValue))
        }
    }

    public var borderTop: CGFloat {
        get {
            guard let node = node else {
                return 0
            }

            return CGFloat(YGNodeStyleGetBorder(node.nodeRef, .top))
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetBorder(node.nodeRef, .top, Float(newValue))
        }
    }

    public var borderRight: CGFloat {
        get {
            guard let node = node else {
                return 0
            }

            return CGFloat(YGNodeStyleGetBorder(node.nodeRef, .right))
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetBorder(node.nodeRef, .right, Float(newValue))
        }
    }

    public var borderBottom: CGFloat {
        get {
            guard let node = node else {
                return 0
            }

            return CGFloat(YGNodeStyleGetBorder(node.nodeRef, .bottom))
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetBorder(node.nodeRef, .bottom, Float(newValue))
        }
    }
}

extension YGNodeStyle {

    public func gap(for gutter: YGGutter) -> CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeStyleGetGap(node.nodeRef, gutter))
    }

    public func setGap(_ length: CGFloat, for gutter: YGGutter) {
        guard let node = node else {
            return
        }

        YGNodeStyleSetGap(node.nodeRef, gutter, Float(length))
    }
}

extension YGNodeStyle {

    public var width: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetWidth(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .auto:
                YGNodeStyleSetWidthAuto(node.nodeRef)
            case .percent:
                YGNodeStyleSetWidthPercent(node.nodeRef, newValue.value)
            case .point:
                YGNodeStyleSetWidth(node.nodeRef, newValue.value)
            default:
                return
            }
        }
    }

    public var minWidth: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetMinWidth(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetMinWidthPercent(node.nodeRef, newValue.value)
            case .point:
                YGNodeStyleSetMinWidth(node.nodeRef, newValue.value)
            default:
                return
            }
        }
    }

    public var maxWidth: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetMaxWidth(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetMaxWidthPercent(node.nodeRef, newValue.value)
            case .point:
                YGNodeStyleSetMaxWidth(node.nodeRef, newValue.value)
            default:
                return
            }
        }
    }

    public var height: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetHeight(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .auto:
                YGNodeStyleSetHeightAuto(node.nodeRef)
            case .percent:
                YGNodeStyleSetHeightPercent(node.nodeRef, newValue.value)
            case .point:
                YGNodeStyleSetHeight(node.nodeRef, newValue.value)
            default:
                return
            }
        }
    }

    public var minHeight: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetMinHeight(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetMinHeightPercent(node.nodeRef, newValue.value)
            case .point:
                YGNodeStyleSetMinHeight(node.nodeRef, newValue.value)
            default:
                return
            }
        }
    }

    public var maxHeight: YGValue {
        get {
            guard let node = node else {
                return .zero
            }

            return YGNodeStyleGetMaxHeight(node.nodeRef)
        }

        set {
            guard let node = node else {
                return
            }

            switch newValue.unit {
            case .percent:
                YGNodeStyleSetMaxHeightPercent(node.nodeRef, newValue.value)
            case .point:
                YGNodeStyleSetMaxHeight(node.nodeRef, newValue.value)
            default:
                return
            }
        }
    }
}

// Yoga specific properties, not compatible with flexbox specification Aspect
// ratio control the size of the undefined dimension of a node. Aspect ratio is
// encoded as a floating point value width/height. e.g. A value of 2 leads to a
// node with a width twice the size of its height while a value of 0.5 gives the
// opposite effect.
//
// - On a node with a set width/height aspect ratio control the size of the
//   unset dimension
// - On a node with a set flex basis aspect ratio controls the size of the node
//   in the cross axis if unset
// - On a node with a measure function aspect ratio works as though the measure
//   function measures the flex basis
// - On a node with flex grow/shrink aspect ratio controls the size of the node
//   in the cross axis if unset
// - Aspect ratio takes min/max dimensions into account
extension YGNodeStyle {

    public var aspectRatio: CGFloat {
        get {
            guard let node = node else {
                return 0
            }

            return CGFloat(YGNodeStyleGetAspectRatio(node.nodeRef))
        }

        set {
            guard let node = node else {
                return
            }

            YGNodeStyleSetAspectRatio(node.nodeRef, Float(newValue))
        }
    }
}
