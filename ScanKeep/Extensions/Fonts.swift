import Foundation
import SwiftUI


//MARK: - CHECK FONTS NAMES AND SET IN EXTENSION
//for family in UIFont.familyNames {
//    print("\(family)")
//    for name in UIFont.fontNames(forFamilyName: family) {
//        print("   \(name)")
//    }
//}


extension Font {
    enum CustomFont: String {
        case SFProTextRegular = "SFProText-Regular"
        case urbanistRegular = "Urbanist-Regular"
        case urbanistSemiBold = "Urbanist-SemiBold"
        case urbanistBold = "Urbanist-Bold"
        
        ////
        case SFProTextHeavy  = "SFProText-Heavy"
        case NunitoRegular = "Nunito-Regular"
        case UrbanistMedium = "Urbanist-Medium"
        case UrbanistMediumItalic = "Urbanist-MediumItalic"
        
        ///
       case QuicksandMedium = "Quicksand-Medium"
       case QuicksandSemiBold = "Quicksand-SemiBold"
       case NunitoSemiBold  = "Nunito-SemiBold"
    case NunitoMedium = "Nunito-Medium"
    case UrbanistSemiBoldItalic = "Urbanist-SemiBoldItalic"
        
    }
    
    static func customFont(_ customFont: CustomFont, size: CGFloat) -> Font {
        return Font.custom(customFont.rawValue, size: size)
    }
}


extension UIFont {
    class func preferredFont(from font: Font) -> UIFont {
        let uiFont: UIFont
        switch font {
            case .largeTitle:
                uiFont = UIFont.preferredFont(forTextStyle: .largeTitle)
            case .title:
                uiFont = UIFont.preferredFont(forTextStyle: .title1)
            case .title2:
                uiFont = UIFont.preferredFont(forTextStyle: .title2)
            case .title3:
                uiFont = UIFont.preferredFont(forTextStyle: .title3)
            case .headline:
                uiFont = UIFont.preferredFont(forTextStyle: .headline)
            case .subheadline:
                uiFont = UIFont.preferredFont(forTextStyle: .subheadline)
            case .callout:
                uiFont = UIFont.preferredFont(forTextStyle: .callout)
            case .caption:
                uiFont = UIFont.preferredFont(forTextStyle: .caption1)
            case .caption2:
                uiFont = UIFont.preferredFont(forTextStyle: .caption2)
            case .footnote:
                uiFont = UIFont.preferredFont(forTextStyle: .footnote)
            case .body:
                fallthrough
            default:
                uiFont = UIFont.preferredFont(forTextStyle: .body)
        }
        return uiFont
    }
}
