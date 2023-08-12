
import Foundation
import yoga

public typealias YGMeasureClosure = (
    _ node: YGNode,
    _ width: CGFloat,
    _ widthMode: YGMeasureMode,
    _ height: CGFloat,
    _ heightMode: YGMeasureMode
) -> CGSize

public typealias YGBaselineClosure = (
    _ node: YGNode,
    _ width: CGFloat,
    _ height: CGFloat
) -> CGFloat

public typealias YGDirtiedClosure = (_ node: YGNode) -> Void

extension YGAlign {

    public static let auto = YGAlignAuto

    public static let flexStart = YGAlignFlexStart

    public static let center = YGAlignCenter

    public static let flexEnd = YGAlignFlexEnd

    public static let stretch = YGAlignStretch

    public static let baseline = YGAlignBaseline

    public static let spaceBetween = YGAlignSpaceBetween

    public static let spaceAround = YGAlignSpaceAround
}

extension YGDimension {

    public static let width = YGDimensionWidth

    public static let height = YGDimensionHeight
}

extension YGDirection {

    public static let inherit = YGDirectionInherit

    public static let LTR = YGDirectionLTR

    public static let RTL = YGDirectionRTL
}

extension YGDisplay {

    public static let flex = YGDisplayFlex

    public static let none = YGDisplayNone
}

extension YGEdge {

    public static let left = YGEdgeLeft

    public static let top = YGEdgeTop

    public static let right = YGEdgeRight

    public static let bottom = YGEdgeBottom

    public static let start = YGEdgeStart

    public static let end = YGEdgeEnd

    public static let hHorizontal = YGEdgeHorizontal

    public static let vertical = YGEdgeVertical

    public static let all = YGEdgeAll
}

extension YGErrata {

    public static let none = YGErrataNone

    public static let stretchFlexBasis = YGErrataStretchFlexBasis

    public static let all = YGErrataAll

    public static let classic = YGErrataClassic
}

extension YGExperimentalFeature: OptionSet {

    public static let webFlexBasis = YGExperimentalFeatureWebFlexBasis

    public static let absolutePercentageAgainstPaddingEdge = YGExperimentalFeatureAbsolutePercentageAgainstPaddingEdge

    public static let fixJNILocalRefOverflows = YGExperimentalFeatureFixJNILocalRefOverflows
}

extension YGFlexDirection {

    public static let column = YGFlexDirectionColumn

    public static let columnReverse = YGFlexDirectionColumnReverse

    public static let row = YGFlexDirectionRow

    public static let rowReverse = YGFlexDirectionRowReverse
}

extension YGGutter {

    public static let column = YGGutterColumn

    public static let row = YGGutterRow

    public static let all = YGGutterAll
}

extension YGJustify {

    public static let flexStart = YGJustifyFlexStart

    public static let center = YGJustifyCenter

    public static let flexEnd = YGJustifyFlexEnd

    public static let spaceBetween = YGJustifySpaceBetween

    public static let spaceAround = YGJustifySpaceAround

    public static let spaceEvenly = YGJustifySpaceEvenly
}

extension YGLogLevel {

    public static let error = YGLogLevelError

    public static let warn = YGLogLevelWarn

    public static let info = YGLogLevelInfo

    public static let debug = YGLogLevelDebug

    public static let verbose = YGLogLevelVerbose

    public static let fatal = YGLogLevelFatal
}

extension YGMeasureMode {

    public static let undefined = YGMeasureModeUndefined

    public static let exactly = YGMeasureModeExactly

    public static let atMost = YGMeasureModeAtMost
}

extension YGNodeType {

    public static let `default` = YGNodeTypeDefault

    public static let text = YGNodeTypeText
}

extension YGOverflow {

    public static let visible = YGOverflowVisible

    public static let hidden = YGOverflowHidden

    public static let scroll = YGOverflowScroll
}

extension YGPositionType {

    public static let `static` = YGPositionTypeStatic

    public static let relative = YGPositionTypeRelative

    public static let absolute = YGPositionTypeAbsolute
}

extension YGPrintOptions: OptionSet {

    public static let layout = YGPrintOptionsLayout

    public static let style = YGPrintOptionsStyle

    public static let children = YGPrintOptionsChildren
}

extension YGUnit {

    public static let undefined = YGUnitUndefined

    public static let point = YGUnitPoint

    public static let percent = YGUnitPercent

    public static let auto = YGUnitAuto
}

extension YGWrap {

    public static let noWrap = YGWrapNoWrap

    public static let wrap = YGWrapWrap

    public static let wrapReverse = YGWrapWrapReverse
}
