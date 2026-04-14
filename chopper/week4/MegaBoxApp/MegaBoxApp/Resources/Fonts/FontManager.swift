//
//  FontManager.swift
//  MegaBox
//
//  Created by 한지민 on 3/20/26.
//

import SwiftUI

extension Font {
    enum Pretendard {
        case extra
        case bold
        case semi
        case regular
        case medium
        case light
        case custom(String)
        
        var value: String {
            switch self {
            case .extra:
                return "Pretendard-ExtraBold"
            case .bold:
                return "Pretendard-Bold"
            case .semi:
                return "Pretendard-SemiBold"
            case .regular:
                return "Pretendard-Regular"
            case .medium:
                return "Pretendard-Medium"
            case .light:
                return "Pretendard-Light"
            case .custom(let name):
                return name
            }
        }
    }
    static func pretendard(_ type: Pretendard, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    // extra
    static let extraBold24: Font = .pretendard(.extra, size: 24)
    
    // bold
    static let bold18: Font = .pretendard(.bold, size: 18)
    static let bold22: Font = .pretendard(.bold, size: 22)
    static let bold24: Font = .pretendard(.bold, size: 24)
    static let bold28: Font = .pretendard(.bold, size: 28)
    
    // semi
    static let semiBold38: Font = .pretendard(.semi, size: 38)
    static let semiBold24: Font = .pretendard(.semi, size: 24)
    static let semiBold18: Font = .pretendard(.semi, size: 18)
    static let semiBold16: Font = .pretendard(.semi, size: 16)
    static let semiBold14: Font = .pretendard(.semi, size: 14)
    static let semiBold13: Font = .pretendard(.semi, size: 13)
    static let semiBold12: Font = .pretendard(.semi, size: 12)
    
    // regular
    static let regular15: Font = .pretendard(.regular, size: 15)
    static let regular18: Font = .pretendard(.regular, size: 18)
    static let regular13: Font = .pretendard(.regular, size: 13)
    static let regular12: Font = .pretendard(.regular, size: 12)
    static let regular9: Font = .pretendard(.regular, size: 9)
    
    // medium
    static let medium18: Font = .pretendard(.medium, size: 18)
    static let medium16: Font = .pretendard(.medium, size: 16)
    static let medium14: Font = .pretendard(.medium, size: 14)
    static let medium13: Font = .pretendard(.medium, size: 13)
    static let medium10: Font = .pretendard(.medium, size: 10)
    static let medium8: Font = .pretendard(.medium, size: 8)
    
    // light
    static let light14: Font = .pretendard(.light, size: 14)
    
}
