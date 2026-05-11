//
//  TokenService.swift
//  MegaBoxApp
//
//  Created by 한지민 on 5/4/26.
//

import Foundation
import Security

struct TokenInfo: Codable {
    let accessToken: String
    let refreshToken: String?
}

class TokenService {
    static let shared = TokenService()
    private init() {}
    
    private let account = "authToken"
    private let service = "com.myApp.tokenInfo"
    
    // 토큰 저장
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
    
    // 토큰 삭제
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
