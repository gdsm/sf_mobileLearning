//
//  KeychainManager.swift
//  SwiftLearning
//
//  Created by Gagandeep on 19/01/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation

/**
 Nice to read this SO thread : https://stackoverflow.com/questions/11614047/what-makes-a-keychain-item-unique-in-ios
 */


class KeychainManager {
    static let sharedInstance = KeychainManager()
    private let service = "com.test.SwiftLearning"
    private let account = "User Name"

    
    private init() {
        
    }
    
    func debug() {
        create()
        read()
    }
    
    /// MARK: CRUD operations on keychaing
    private func create() {
        let password = "Sensitive password"

        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                       kSecAttrService as String: service,
                                       kSecAttrAccount as String: account,
                                       kSecValueData as String: password.data(using: .utf8)!]
        delete()
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Error in saving item in keychain \(SecCopyErrorMessageString(status, nil) as? String)")
            return
        }
    }
    
    private func read() {
        let getquery: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                       kSecAttrService as String: service,
                                       kSecAttrAccount as String: account,
//                                       kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
                                       kSecReturnData as String: true]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(getquery as CFDictionary, &item)
        guard status == errSecSuccess else {
            print("Error in reading item in keychain \(SecCopyErrorMessageString(status, nil) as? String)")
            return
        }
        if let data = item as? Data {
            let result = String(data: data, encoding: .utf8)
            print("Read Data from keychain : \(String(describing: result))")
        }
    }
    
    private func delete() {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                       kSecAttrService as String: service,
                                       kSecAttrAccount as String: account]
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess else {
            print("Error in deleting item in keychain \(SecCopyErrorMessageString(status, nil) as? String)")
            return
        }
    }
}
