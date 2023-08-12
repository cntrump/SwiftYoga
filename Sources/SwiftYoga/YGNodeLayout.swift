
import Foundation
import yoga

public class YGNodeLayout {

    weak var node: YGNode?

    init(node: YGNode) {
        self.node = node
    }
}

extension YGNodeLayout {

    public var left: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetLeft(node.nodeRef))
    }

    public var top: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetTop(node.nodeRef))
    }

    public var right: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetRight(node.nodeRef))
    }

    public var bottom: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetBottom(node.nodeRef))
    }

    public var width: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetWidth(node.nodeRef))
    }

    public var height: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetHeight(node.nodeRef))
    }
}

extension YGNodeLayout {

    public var direction: YGDirection {
        guard let node = node else {
            return .inherit
        }

        return YGNodeLayoutGetDirection(node.nodeRef)
    }

    public var hadOverflow: Bool {
        guard let node = node else {
            return false
        }

        return YGNodeLayoutGetHadOverflow(node.nodeRef)
    }
}

// Get the computed values for these nodes after performing layout. If they were
// set using point values then the returned value will be the same as
// YGNodeStyleGetXXX. However if they were set using a percentage value then the
// returned value is the computed value used during layout.

extension YGNodeLayout {

    public var marginLeft: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetMargin(node.nodeRef, .left))
    }

    public var marginTop: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetMargin(node.nodeRef, .top))
    }

    public var marginRight: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetMargin(node.nodeRef, .right))
    }

    public var marginBottom: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetMargin(node.nodeRef, .bottom))
    }
}

extension YGNodeLayout {

    public var paddingLeft: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetPadding(node.nodeRef, .left))
    }

    public var paddingTop: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetPadding(node.nodeRef, .top))
    }

    public var paddingRight: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetPadding(node.nodeRef, .right))
    }

    public var paddingBottom: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetPadding(node.nodeRef, .bottom))
    }
}

extension YGNodeLayout {

    public var borderLeft: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetBorder(node.nodeRef, .left))
    }

    public var borderTop: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetBorder(node.nodeRef, .top))
    }

    public var borderRight: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetBorder(node.nodeRef, .right))
    }

    public var borderBottom: CGFloat {
        guard let node = node else {
            return 0
        }

        return CGFloat(YGNodeLayoutGetBorder(node.nodeRef, .bottom))
    }
}
