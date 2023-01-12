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
    
    static func inter(_ type: Inter, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
    
    static func gilory(_ type: Gilory, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
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
                return "Inter-Black.ttf"
            case .blackItalic:
                return "Inter-BlackItalic.ttf"
            case .bold:
                return "Inter-Bold.ttf"
            case .boldItalic:
                return "Inter-BoldItalic.ttf"
            case .extraBold:
                return "Inter-ExtraBold.ttf"
            case .extraLight:
                return "Inter-ExtraLight.ttf"
            case .regular:
                return "Inter-Regular.ttf"
            case .semiBold:
                return "Inter-SemiBold.ttf"
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
                return "Gilroy-Black.ttf"
            case .bold:
                return "Gilroy-Bold.ttf"
            case .heavy:
                return "Gilroy-Heavy.ttf"
            case .light:
                return "Gilroy-Light.ttf"
            case .medium:
                return "Gilroy-Medium.ttf"
            case .regular:
                return "Gilroy-Regular.ttf"
            case .semiBold:
                return "Gilroy-SemiBold.ttf"
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
