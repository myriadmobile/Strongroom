//
//  StrongRoomHelper.swift
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
}
