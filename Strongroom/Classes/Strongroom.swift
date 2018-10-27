//
//  Strongroom.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/10/18.
//

import Foundation

public class Strongroom {
    private init() { } // Class cannot be initialized
    
    public static func clearValues<S:StrongroomSafe>(safeType: S.Type) {
        clearValues(safe: lazyLoadSafe(safeType))
    }
    
    public static func clearValues(safe: StrongroomSafe) {
        safe.clearValues()
    }
}

// NSCoding support
extension Strongroom {
    public static func setValue<S: StrongroomSafe, T: NSCoding>(_ value: T?, forKey key: String, safeType: S.Type) {
        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func getValue<T: NSCoding, S:StrongroomSafe>(forKey key: String, safeType: S.Type) -> T? {
        return getValue(forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func setValue<T:NSCoding>(_ value: T?, forKey key: String, safe: StrongroomSafe) {
        setValue(value, forKey: key, safe: safe, archiver: NSCodingArchiver())
    }
    
    public static func getValue<T: NSCoding>(forKey key: String, safe: StrongroomSafe) -> T? {
        return getValue(forKey: key, safe: safe, archiver: NSCodingArchiver())
    }
}

// Codable support
extension Strongroom {
    public static func setValue<S: StrongroomSafe, T: Codable>(_ value: T?, forKey key: String, safeType: S.Type) {
        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func getValue<T: Codable, S:StrongroomSafe>(forKey key: String, safeType: S.Type) -> T? {
        return getValue(forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func setValue<T:Codable>(_ value: T?, forKey key: String, safe: StrongroomSafe) {
        setValue(value, forKey: key, safe: safe, archiver: CodableArchiver())
    }
    
    public static func getValue<T: Codable>(forKey key: String, safe: StrongroomSafe) -> T? {
        return getValue(forKey: key, safe: safe, archiver: CodableArchiver())
    }
}
