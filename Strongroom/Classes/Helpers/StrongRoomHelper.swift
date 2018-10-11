//
//  StrongRoomHelper.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/11/18.
//

import UIKit

internal class CodedWrapper: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(object, forKey: "object")
    }
    
    required init?(coder aDecoder: NSCoder) {
        object = aDecoder.decodeObject(forKey: "object")
    }
    
    var object: Any?
    
    init(object: Any?) {
        self.object = object
    }
}

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
    
    internal static func storeValue(_ value: Any?, forKey key: String, safe: StrongroomSafe) {
        var data: Data? = nil
        if let value = value {
            data = NSKeyedArchiver.archivedData(withRootObject: CodedWrapper(object: value));
        }

        safe.setValue(data, forKey: key)
    }
    
    internal static func getStoredValue(forKey key: String, safe: StrongroomSafe) -> Any? {
        var value: Any? = nil
        
        if let data = safe.getValue(forKey: key) {
            let wrapper = NSKeyedUnarchiver.unarchiveObject(with:data) as? CodedWrapper
            value = wrapper?.object
        }
        
        return value
    }
}
