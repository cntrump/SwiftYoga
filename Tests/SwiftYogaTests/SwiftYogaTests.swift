
import XCTest
@testable import SwiftYoga

final class SwiftYogaTests: XCTestCase {

    func testCase_0() throws {
        let config = YGConfig()
        let root = YGNode(config: config) {
            $0.width = .point(100)
        }

        let leaf1 = YGNode(config: root.config) {
            $0.height = .point(50)
        }
        root.addSubnode(leaf1)

        let leaf2 = YGNode(config: root.config) {
            $0.height = .point(100)
        }
        root.addSubnode(leaf2)

        XCTAssertEqual(leaf1, root.subnodes[0])
        XCTAssertEqual(leaf2, root.subnodes[1])

        root.exchangeSubnode(at: 1, withSubnodeAt: 0)

        XCTAssertEqual(leaf2, root.subnodes[0])
        XCTAssertEqual(leaf1, root.subnodes[1])

        let leaf3 = YGNode(config: root.config) {
            $0.height = .point(30)
        }
        root.insertSubnode(leaf3, aboveSubnode: leaf1)
        XCTAssertEqual(leaf1, root.subnodes[2])
        XCTAssertEqual(leaf3, root.subnodes[1])

        let leaf4 = YGNode(config: root.config) {
            $0.height = .point(20)
        }
        root.insertSubnode(leaf4, belowSubnode: leaf1)
        XCTAssertEqual(leaf1, root.subnodes[2])
        XCTAssertEqual(leaf4, root.subnodes[3])

        root.calculateLayout(width: YGUndefined, height: YGUndefined)

        XCTAssertEqual(root.subnodes.count, root.count)
        XCTAssertEqual(root.layout.width, 100)
        XCTAssertEqual(root.layout.height, 50 + 100 + 30 + 20)

        XCTAssertEqual(leaf2.layout.top, 0)
        XCTAssertEqual(leaf2.layout.width, 100)
        XCTAssertEqual(leaf2.layout.height, 100)

        XCTAssertEqual(leaf3.layout.top, 100)
        XCTAssertEqual(leaf3.layout.width, 100)
        XCTAssertEqual(leaf3.layout.height, 30)

        XCTAssertEqual(leaf1.layout.top, 130)
        XCTAssertEqual(leaf1.layout.width, 100)
        XCTAssertEqual(leaf1.layout.height, 50)
        
        XCTAssertEqual(leaf4.layout.top, 180)
        XCTAssertEqual(leaf4.layout.width, 100)
        XCTAssertEqual(leaf4.layout.height, 20)
    }

    func testCase_1() throws {
        let config = YGConfig()
        let root = YGNode(config: config) {
            $0.flexDirection = .row
        }

        for _ in 0..<3 {
            root.addSubnode(YGNode(config: root.config) {
                $0.width = .point(50)
                $0.aspectRatio = 1
            })
        }

        root.calculateLayout(width: YGUndefined, height: YGUndefined)

        XCTAssertEqual(root.layout.width, 150)
        XCTAssertEqual(root.layout.height, 50)
    }

    func testCase_2() throws {
        let config = YGConfig()
        let root = YGNode(config: config) {
            $0.flexDirection = .column
            $0.width = .point(200)
        }

        for _ in 0..<3 {
            root.addSubnode(YGNode(config: root.config) {
                $0.aspectRatio = 1
            })
        }

        root.calculateLayout(width: YGUndefined, height: YGUndefined)

        XCTAssertEqual(root.layout.width, 200)
        XCTAssertEqual(root.layout.height, 600)

        var leaf = root.subnodes[0]
        XCTAssertEqual(leaf.layout.top, 0)
        leaf = root.subnodes[1]
        XCTAssertEqual(leaf.layout.top, 200)
        leaf = root.subnodes[2]
        XCTAssertEqual(leaf.layout.top, 400)
    }

    func testCase_3() throws {
        let config = YGConfig()
        let root = YGNode(config: config) {
            $0.flexDirection = .column
            $0.width = .point(200)
            $0.height = .point(200)
            $0.paddingLeft = .point(20)
            $0.paddingTop = .point(20)
        }

        let leaf = YGNode(config: root.config) {
            $0.position = .absolute
            $0.width = .percent(100)
            $0.height = .percent(100)
        }

        root.addSubnode(leaf)

        root.calculateLayout(width: YGUndefined, height: YGUndefined)

        XCTAssertEqual(leaf.layout.left, 0)
        XCTAssertEqual(leaf.layout.top, 0)
        XCTAssertEqual(leaf.layout.width, 180)
        XCTAssertEqual(leaf.layout.height, 180)
    }
}
