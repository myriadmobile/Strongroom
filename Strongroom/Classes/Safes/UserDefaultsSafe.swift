//
//  UserDefaultsSafe.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/10/18.
//

import UIKit

public class UserDefaultsSafe: StrongroomSafe {
    public required init() { }
    
    public func setValue(_ value: Data?, forKey key: String) {
        if let value = value {
            UserDefaults.standard.setValue(value, forKey: key)
        } else {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    
    public func getValue(forKey key: String) -> Data? {
        return UserDefaults.standard.object(forKey: key) as? Data
    }
    
    public func clearValues() {
        let defaults = UserDefaults.standard
        
        for key in defaults.dictionaryRepresentation().keys {
            defaults.removeObject(forKey: key)
        }
    }
}
