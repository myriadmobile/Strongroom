//
//  StrongroomHelper.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/11/18.
//

import UIKit

internal extension Strongroom {
    private static var safeCache = [StrongroomSafe]()
    
    internal static func lazyLoadSafe<T: StrongroomSafe>(_ safeType: T.Type) -> T {
        var safe = safeCache.first { (safe) -> Bool in
            return type(of: safe) == safeType
        }
        
        if safe == nil {
            safe = T.init()
            safeCache.append(safe!)
        }
        
        return safe as! T
    }
    
    internal static func setValue<A: StrongroomArchiver>(_ value: A.T?, forKey key: String, safe: StrongroomSafe, archiver: A) {
        let data = archiver.archiveValue(value)
        safe.setData(data, forKey: key)
    }
    
    internal static func getValue<A: StrongroomArchiver>(forKey key: String, safe: StrongroomSafe, archiver: A) -> A.T? {
        let data = safe.getData(forKey: key)
        return archiver.unarchiveValue(data: data)
    }
}
