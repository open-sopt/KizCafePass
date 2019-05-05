//
//  KCPUserDefaults.swift
//  KizCafePass
//
//  Created by seungwook-jung on 05/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import Foundation



private enum Key {
    static let deviceToken = "deviceToken"
    static let isPushOn = "isPushOn"
}

public enum KCPUserDefaults {
    
    // MARK: - module user defaults implementation
    struct UserDefault<ValueType> {
        let key: String
        
        var value: ValueType? {
            return UserDefaults.standard.value(forKey: self.key) as? ValueType
        }
        
        func set(_ value: ValueType?) {
            UserDefaults.standard.set(value, forKey: self.key)
        }
    }
    
    // MARK: - data
    static let DeviceToken = UserDefault<String>(key: Key.deviceToken)
    static let IsPushOn = UserDefault<Bool>(key: Key.isPushOn)
}


// Useage

// KCPUserDefaults.DeviceToken.set("aaa")
// KCPUserDefaults.DeviceToken.value
