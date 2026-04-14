//
//  Fonts.swift
//  Megabox
//
//  Created by 이준성 on 3/16/26.
//

import SwiftUI

extension Font{
    enum Pretend{
        case extraBold, bold,semiBold, regular, medium, light
        var value: String {
            switch self {
            case .extraBold: return "Pretendard-ExtraBold"
            case .bold:      return "Pretendard-Bold"
            case .semiBold:  return "Pretendard-SemiBold"
            case .medium:    return "Pretendard-Medium"
            case .regular:   return "Pretendard-Regular"
            case .light:     return "Pretendard-Light"
            }
        }
    }
    
    static func pretend(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    // Extra / Bold 계열
    static let extraBold24: Font = .pretend(type: .extraBold, size: 24)
    static let bold18: Font = .pretend(type: .bold, size: 18)
    static let bold22: Font = .pretend(type: .bold, size: 22)
    static let bold24: Font = .pretend(type: .bold, size: 24)
    static let bold28: Font = .pretend(type: .bold, size: 28)
        
    // semiBold 계열
    static let semiBold38: Font = .pretend(type: .semiBold, size: 38)
    static let semiBold24: Font = .pretend(type: .semiBold, size: 24)
    static let semiBold18: Font = .pretend(type: .semiBold, size: 18)
    static let semiBold16: Font = .pretend(type: .semiBold, size: 16)
    static let semiBold14: Font = .pretend(type: .semiBold, size: 14)
    static let semiBold13: Font = .pretend(type: .semiBold, size: 13)
    static let semiBold12: Font = .pretend(type: .semiBold, size: 12)
   
    // Regular 계열
    static let regular20: Font = .pretend(type: .regular, size: 20)
    static let regular18: Font = .pretend(type: .regular, size: 18)
    static let regular13: Font = .pretend(type: .regular, size: 13)
    static let regular12: Font = .pretend(type: .regular, size: 12)
    static let regular9: Font  = .pretend(type: .regular, size: 9)
        
    // Medium 계열
    static let medium18: Font = .pretend(type: .medium, size: 18)
    static let medium17: Font = .pretend(type: .medium, size: 17)
    static let medium16: Font = .pretend(type: .medium, size: 16)
    static let medium14: Font = .pretend(type: .medium, size: 14)
    static let medium13: Font = .pretend(type: .medium, size: 13)
    static let medium10: Font = .pretend(type: .medium, size: 10)
    static let medium8: Font  = .pretend(type: .medium, size: 8)
    
    // Light 계열
    static let light14: Font = .pretend(type: .light, size: 14)
}
