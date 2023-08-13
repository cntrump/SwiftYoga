# SwiftYoga

A simple Swift wrapper for [yoga](https://github.com/facebook/yoga).

```
.package(url: "https://github.com/cntrump/SwiftYoga.git", .branch("main"))
```

Example code:

```swift
import SwiftYoga

let config = YGConfig()
// default flex direction is column
let root = YGNode(config: config) {
    $0.width = .point(100)
}

let leaf = YGNode(config: root.config) {
    $0.height = .point(50)
}
root.addSubnode(leaf)

// calculate layout
root.calculateLayout(width: YGUndefined, height: YGUndefined)

XCTAssertEqual(root.layout.width, 100)
XCTAssertEqual(root.layout.height, 50)
```
