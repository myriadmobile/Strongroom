//
//  Strongroom.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/10/18.
//

import Foundation

public protocol StrongroomSafe {
    init();
    func setValue(_ value: Data?, forKey key: String)
    func getValue(forKey key: String) -> Data?
    func clearValues()
}

public class Strongroom {
    private init() { } // Class cannot be initialized
    
    public static func setValue<T:NSCoding, S:StrongroomSafe>(_ value: T?, forKey key: String, safeType: S.Type) {
        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func setValue<T:NSCoding>(_ value: T?, forKey key: String, safe: StrongroomSafe) {
        storeValue(value, forKey: key, safe: safe)
    }
    
    public static func setValue<S:StrongroomSafe>(_ value: Bool?, forKey key: String, safeType: S.Type) {
        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func setValue(_ value: Bool?, forKey key: String, safe: StrongroomSafe) {
        storeValue(value, forKey: key, safe: safe)
    }
    
    public static func setValue<S:StrongroomSafe>(_ value: String?, forKey key: String, safeType: S.Type) {
        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func setValue(_ value: String?, forKey key: String, safe: StrongroomSafe) {
        storeValue(value, forKey: key, safe: safe)
    }
    
    public static func setValue<S:StrongroomSafe>(_ value: Int?, forKey key: String, safeType: S.Type) {
        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func setValue(_ value: Int?, forKey key: String, safe: StrongroomSafe) {
        storeValue(value, forKey: key, safe: safe)
    }
    
    public static func setValue<S:StrongroomSafe>(_ value: Float?, forKey key: String, safeType: S.Type) {
        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func setValue(_ value: Float?, forKey key: String, safe: StrongroomSafe) {
        storeValue(value, forKey: key, safe: safe)
    }
    
    public static func setValue<S:StrongroomSafe>(_ value: Double?, forKey key: String, safeType: S.Type) {
        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func setValue(_ value: Double?, forKey key: String, safe: StrongroomSafe) {
        storeValue(value, forKey: key, safe: safe)
    }
    
    public static func getValue<T, S:StrongroomSafe>(forKey key: String, safeType: S.Type) -> T? {
        return getValue(forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func getValue<T>(forKey key: String, safe: StrongroomSafe) -> T? {
        return getStoredValue(forKey: key, safe: safe) as? T
    }
    
    public static func clearValues<S:StrongroomSafe>(safeType: S.Type) {
        lazyLoadSafe(safeType).clearValues()
    }
    
    public static func clearValues(safe: StrongroomSafe) {
        safe.clearValues()
    }
}
