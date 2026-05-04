//
//  TokenService.swift
//  MegaBoxApp
//
//  Created by 한지민 on 5/4/26.
//

import Foundation
import Security

// 1. 토큰 정보를 담을 그릇 (배운 개념)
struct TokenInfo: Codable {
    let accessToken: String
    let refreshToken: String?
}

// 2. 키체인을 관리하는 서비스 (배운 개념)
class TokenService {
    static let shared = TokenService()
    private init() {}
    
    // 이 부분은 본인의 앱 이름에 맞게 나중에 수정해도 됩니다. 일단 그대로 두세요!
    private let account = "authToken"
    private let service = "com.myApp.tokenInfo"
    
    // 토큰 저장하기
    @discardableResult
    func saveTokenInfo(_ tokenInfo: TokenInfo) -> OSStatus {
        do {
            let data = try JSONEncoder().encode(tokenInfo)
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account,
                kSecAttrService as String: service,
                kSecValueData as String: data,
                kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
            ]
            SecItemDelete(query as CFDictionary)
            return SecItemAdd(query as CFDictionary, nil)
        } catch {
            return errSecParam
        }
    }
    
    // 토큰 불러오기
    func loadTokenInfo() -> TokenInfo? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess, let data = item as? Data else { return nil }
        
        do {
            return try JSONDecoder().decode(TokenInfo.self, from: data)
        } catch {
            return nil
        }
    }
    
    // 토큰 삭제하기
    @discardableResult
    func deleteTokenInfo() -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service
        ]
        return SecItemDelete(query as CFDictionary)
    }
}
