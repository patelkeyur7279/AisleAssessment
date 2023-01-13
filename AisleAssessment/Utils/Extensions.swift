//
//  Extensions.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 12/01/23.
//

import Foundation
import SwiftUI

// MARK: UserDefaults
extension UserDefaults {
    
    // MARK: - Global Static Variables
    private static let TOKEN = "Token"
    
    func saveToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: UserDefaults.TOKEN)
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaults.TOKEN)
    }
    
}


// MARK: Fonts
extension Font {
    
    static func refinery95(_ type: Refinery95, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
    
    static func inter(_ type: Inter, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
    
    static func gilory(_ type: Gilory, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
    
    enum Refinery95 {
        case regular
        case medium
        case bold
        
        var value: String {
            switch self {
            case .regular:
                return "Refinery-95Regular"
            case .medium:
                return "Refinery-95Medium"
            case .bold:
                return "Refinery-95Bold"
            }
        }
    }
    
    enum Inter {
        case black
        case blackItalic
        case bold
        case boldItalic
        case extraBold
        case extraLight
        case regular
        case semiBold
        
        var value: String {
            switch self {
            case .black:
                return "Inter-Black"
            case .blackItalic:
                return "Inter-BlackItalic"
            case .bold:
                return "Inter-Bold"
            case .boldItalic:
                return "Inter-BoldItalic"
            case .extraBold:
                return "Inter-ExtraBold"
            case .extraLight:
                return "Inter-ExtraLight"
            case .regular:
                return "Inter-Regular"
            case .semiBold:
                return "Inter-SemiBold"
            }
        }
    }
    
    enum Gilory {
        case black
        case bold
        case heavy
        case light
        case medium
        case regular
        case semiBold
        
        var value: String {
            switch self {
            case .black:
                return "Gilroy-Black"
            case .bold:
                return "Gilroy-Bold"
            case .heavy:
                return "Gilroy-Heavy.ttf"
            case .light:
                return "Gilroy-Light"
            case .medium:
                return "Gilroy-Medium"
            case .regular:
                return "Gilroy-Regular"
            case .semiBold:
                return "Gilroy-SemiBold"
            }
        }
    }
    
}

// MARK: Color
extension Color {
    
    static let lightGray = Color("LightGray")
    static let lightYellow = Color("LightYellow")
    static let transparentGray = Color("TransparentGray")
    
}
