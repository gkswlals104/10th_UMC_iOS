//
//  KeychainService.swift
//  MegaBoxApp
//
//  Created by 한지민 on 5/4/26.
//

import Foundation
import Security

// 개념 설명 문서에 있던 비밀번호 관리용 싱글톤 클래스
class KeychainService {
    
    static let shared = KeychainService()
    private init() {}
    
    /// Keychain에 사용자의 비밀번호를 저장합니다.
    @discardableResult
    func savePasswordToKeychain(account: String, service: String, password: String) -> OSStatus {
        guard let passwordData = password.data(using: .utf8) else {
            return errSecParam // 잘못된 데이터
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecValueData as String: passwordData,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]

        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        return status
    }

    /// Keychain에서 저장된 데이터를 불러옵니다.
    @discardableResult
    func load(account: String, service: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        guard status == errSecSuccess else {
            return nil
        }

        guard let data = item as? Data,
              let result = String(data: data, encoding: .utf8) else {
            return nil
        }

        return result
    }
    
    /// Keychain에서 항목을 삭제합니다.
    @discardableResult
    func delete(account: String, service: String) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service
        ]
        return SecItemDelete(query as CFDictionary)
    }
}
