
import Foundation
import yoga

public class YGConfig: Hashable {

    private(set) var configRef: YGConfigRef

    deinit {
        YGConfigFree(configRef)
    }

    public init(scaleFactor: CGFloat = 1, useWebDefaults: Bool = true) {
        configRef = YGConfigNew()
        YGConfigSetUseWebDefaults(configRef, useWebDefaults)
        YGConfigSetPointScaleFactor(configRef, Float(scaleFactor))
        YGConfigSetContext(configRef, Unmanaged.passUnretained(self).toOpaque())
    }

    public static func == (lhs: YGConfig, rhs: YGConfig) -> Bool {
        return lhs.configRef == rhs.configRef
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(configRef)
    }
}

extension YGConfig {

    // Set this to number of pixels in 1 point to round calculation results If you
    // want to avoid rounding - set PointScaleFactor to 0
    public var pointScaleFactor: CGFloat {
        get {
            return CGFloat(YGConfigGetPointScaleFactor(configRef))
        }

        set {
            YGConfigSetPointScaleFactor(configRef, Float(newValue))
        }
    }

    public var experimentalFeatures: YGExperimentalFeature {
        get {
            var features = YGExperimentalFeature()

            if YGConfigIsExperimentalFeatureEnabled(configRef, .webFlexBasis) {
                features.insert(.webFlexBasis)
            }

            if YGConfigIsExperimentalFeatureEnabled(configRef, .absolutePercentageAgainstPaddingEdge) {
                features.insert(.absolutePercentageAgainstPaddingEdge)
            }

            return features
        }

        set {
            YGConfigSetExperimentalFeatureEnabled(configRef, .webFlexBasis, newValue.contains(.webFlexBasis))
            YGConfigSetExperimentalFeatureEnabled(configRef, .absolutePercentageAgainstPaddingEdge, newValue.contains(.absolutePercentageAgainstPaddingEdge))
        }
    }

    // Using the web defaults is the preferred configuration for new projects. Usage
    // of non web defaults should be considered as legacy.
    public var useWebDefaults: Bool {
        get {
            return YGConfigGetUseWebDefaults(configRef)
        }

        set {
            YGConfigSetUseWebDefaults(configRef, newValue)
        }
    }

    public var errata: YGErrata {
        get {
            return YGConfigGetErrata(configRef)
        }

        set {
            YGConfigSetErrata(configRef, newValue)
        }
    }
}
