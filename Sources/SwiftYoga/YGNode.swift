
import Foundation
import yoga

public class YGNode: Hashable {

    public var measureFunc: YGMeasureClosure? {
        didSet {
            guard measureFunc != nil else {
                YGNodeSetMeasureFunc(nodeRef, nil)
                return
            }

            YGNodeSetMeasureFunc(nodeRef) { (nodeRef, width, widthMode, height, heightMode) -> YGSize in
                let node = Unmanaged<YGNode>.fromOpaque(YGNodeGetContext(nodeRef)).takeUnretainedValue()
                let size = node.measureFunc?(node, CGFloat(width), widthMode, CGFloat(height), heightMode) ?? CGSize(width: 0, height: 0)

                return YGSize(width: Float(size.width), height: Float(size.height))
            }
        }
    }

    public var baselineFunc: YGBaselineClosure? {
        didSet {
            guard baselineFunc != nil else {
                YGNodeSetBaselineFunc(nodeRef, nil)
                return
            }

            YGNodeSetBaselineFunc(nodeRef) { (nodeRef, width, height) -> Float in
                let node = Unmanaged<YGNode>.fromOpaque(YGNodeGetContext(nodeRef)).takeUnretainedValue()
                return Float(node.baselineFunc?(node, CGFloat(width), CGFloat(height)) ?? 0)
            }
        }
    }

    public var dirtiedFunc: YGDirtiedClosure? {
        didSet {
            guard dirtiedFunc != nil else {
                YGNodeSetDirtiedFunc(nodeRef, nil)
                return
            }

            YGNodeSetDirtiedFunc(nodeRef) { (nodeRef) in
                let node = Unmanaged<YGNode>.fromOpaque(YGNodeGetContext(nodeRef)).takeUnretainedValue()
                node.dirtiedFunc?(node)
            }
        }
    }

    public private(set) var config: YGConfig

    public private(set) lazy var style = YGNodeStyle(node: self)

    public private(set) lazy var layout = YGNodeLayout(node: self)

    private lazy var children = [YGNode]()

    private(set) var nodeRef: YGNodeRef

    deinit {
        YGNodeFree(nodeRef)
        children.removeAll()
    }

    public init(config: YGConfig) {
        self.config = config
        nodeRef = YGNodeNewWithConfig(config.configRef)
        YGNodeStyleSetFlexDirection(nodeRef, YGFlexDirectionColumn)
        YGNodeSetContext(nodeRef, Unmanaged.passUnretained(self).toOpaque())
    }

    public static func == (lhs: YGNode, rhs: YGNode) -> Bool {
        return lhs.nodeRef == rhs.nodeRef
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(nodeRef)
    }
}

extension YGNode {

    public func addSubnode(_ child: YGNode) {
        insertSubnode(child, at: children.count)
    }

    public func insertSubnode(_ child: YGNode, at index: Int) {
        guard children.count >= index, !children.contains(child) else {
            return
        }

        if YGNodeHasMeasureFunc(nodeRef) {
            YGNodeSetMeasureFunc(nodeRef, nil)
        }

        YGNodeInsertChild(nodeRef, child.nodeRef, index)
        children.insert(child, at: index)
    }

    public func insertSubnode(_ child: YGNode, aboveSubnode siblingSubnode: YGNode) {
        guard let index = children.firstIndex(of: siblingSubnode) else {
            return
        }

        insertSubnode(child, at: index)
    }

    public func insertSubnode(_ child: YGNode, belowSubnode siblingSubnode: YGNode) {
        guard let index = children.firstIndex(of: siblingSubnode) else {
            return
        }

        insertSubnode(child, at: index + 1)
    }

    public func exchangeSubnode(at index1: Int, withSubnodeAt index2: Int) {
        let count = children.count
        guard count > index1, count > index2, index1 != index2 else {
            return
        }

        swapSubnode(children[index1], at: index2)
    }

    public func swapSubnode(_ child: YGNode, at index: Int) {
        guard children.count > index, let srcIndex = children.firstIndex(of: child) else {
            return
        }

        let dstNode = children[index]
        YGNodeSwapChild(nodeRef, child.nodeRef, index)
        YGNodeSwapChild(nodeRef, dstNode.nodeRef, srcIndex)
        children.swapAt(srcIndex, index)
    }

    public func removeSubnode(_ child: YGNode) {
        guard let index = children.firstIndex(of: child) else {
            return
        }

        YGNodeRemoveChild(nodeRef, child.nodeRef)
        children.remove(at: index)
    }

    public var supernode: YGNode? {
        let ownerRef = YGNodeGetOwner(nodeRef)
        guard ownerRef != nil else {
            return nil
        }

        return Unmanaged<YGNode>.fromOpaque(YGNodeGetContext(ownerRef)).takeUnretainedValue()
    }

    public var subnodes: [YGNode] {
        return children
    }

    public var count: Int {
        return Int(YGNodeGetChildCount(nodeRef))
    }
}

extension YGNode {

    public func bringSubnodeToFront(_ child: YGNode) {
        guard let srcIndex = children.firstIndex(of: child), srcIndex > 0 else {
            return
        }

        YGNodeSwapChild(nodeRef, child.nodeRef, 0)
        children.swapAt(srcIndex, 0)
    }

    public func sendSubnodeToBack(_ child: YGNode) {
        guard let srcIndex = children.firstIndex(of: child) else {
            return
        }

        let lastIndex = children.count - 1
        guard srcIndex != lastIndex else {
            return
        }

        YGNodeSwapChild(nodeRef, child.nodeRef, lastIndex)
        children.swapAt(srcIndex, lastIndex)
    }

    public func removeFromSupernode() {
        supernode?.removeSubnode(self)
    }
}

extension YGNode {

    public var isReferenceBaseline: Bool {
        get {
            return YGNodeIsReferenceBaseline(nodeRef)
        }

        set {
            YGNodeSetIsReferenceBaseline(nodeRef, newValue)
        }
    }
}

extension YGNode {

    public func calculateLayout(size: CGSize) {
        calculateLayout(width: size.width, height: size.height)
    }

    public func calculateLayout(width: CGFloat, height: CGFloat) {
        let owner = self.supernode ?? self

        YGNodeCalculateLayout(nodeRef,
                              width.isNaN ? .nan : Float(width),
                              height.isNaN ? .nan : Float(height),
                              YGNodeStyleGetDirection(owner.nodeRef))
    }

    public func markDirty() {
        YGNodeMarkDirty(nodeRef)
    }

    public func markDirtyAndPropagateToDescendants() {
        YGNodeMarkDirtyAndPropagateToDescendants(nodeRef)
    }

    public var isDirty: Bool {
        YGNodeIsDirty(nodeRef)
    }
}
