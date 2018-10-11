//
//  NSCacheSafe.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/11/18.
//

import UIKit

public class NSCacheSafe: StrongroomSafe {
    private let cache = NSCache<NSString, NSData>()
    
    public required init() { }
    
    public func setValue(_ value: Data?, forKey key: String) {
        let key = NSString(string: key)
        if let value = value {
            cache.setObject(NSData(data: value), forKey: key)
        } else {
            cache.removeObject(forKey: key)
        }
    }
    
    public func getValue(forKey key: String) -> Data? {
        let key = NSString(string: key)
        var result: Data? = nil
        if let data = cache.object(forKey: key) {
            result = Data(referencing: data)
        }
        return result
    }
    
    public func clearValues() {
        cache.removeAllObjects()
    }
}
