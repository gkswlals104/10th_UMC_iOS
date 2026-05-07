//
//  KeychainService.swift
//  MegaBoxApp
//
//  Created by 한지민 on 5/4/26.
//

import Foundation
import Security

// 비밀번호 관리 싱글톤 클래스
class KeychainService {
    
    static let shared = KeychainService()
    private init() {}
    

//MARK: 키체인에 사용자 비밀번호 저장
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

//MARK: 키체인에서 저장된 데이터 불러오기
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
    

//MARK: 키체인에서 항목 삭제
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
