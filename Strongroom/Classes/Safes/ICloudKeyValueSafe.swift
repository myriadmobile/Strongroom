//
//  NSCacheSafe.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/11/18.
//

import UIKit

public class ICloudKeyValueSafe: StrongroomSafe {
    public required init() {
        NSUbiquitousKeyValueStore.default.synchronize()
    }
    
    public func setData(_ data: Data?, forKey key: String) {
        let defaults = NSUbiquitousKeyValueStore.default
        if let data = data {
            defaults.set(data, forKey: key)
        } else {
            defaults.removeObject(forKey: key)
        }
    }
    
    public func getData(forKey key: String) -> Data? {
        return NSUbiquitousKeyValueStore.default.data(forKey: key)
    }
    
    public func clearValues() {
        let defaults = NSUbiquitousKeyValueStore.default

        for key in defaults.dictionaryRepresentation.keys {
            defaults.removeObject(forKey: key)
        }
    }
}
