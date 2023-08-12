
import Foundation
import yoga

public let YGUndefined = CGFloat.nan

extension YGValue {

    public static let auto = YGValueAuto

    public static let undefined = YGValueUndefined

    public static let zero = YGValueZero

    public static func point(_ point: CGFloat) -> YGValue {
        return YGValue(value: Float(point), unit: .point)
    }

    public static func percent(_ point: CGFloat) -> YGValue {
        return YGValue(value: Float(point), unit: .percent)
    }
}
