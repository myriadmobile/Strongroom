//
//  Strongroom.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/10/18.
//

import Foundation

//TODO: Move This
public protocol StrongroomSafe {
    init();
    func setData(_ data: Data?, forKey key: String)
    func getData(forKey key: String) -> Data?
    func clearValues()
}

public class Strongroom {
    private init() { } // Class cannot be initialized
    
//    public static func setValue<T:NSCoding, S:StrongroomSafe>(_ value: T?, forKey key: String, safeType: S.Type) {
//        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
//    }
//
//    public static func setValue<T:NSCoding>(_ value: T?, forKey key: String, safe: StrongroomSafe) {
//        storeValue(value, forKey: key, safe: safe)
//    }
    
    public static func setValue<S: StrongroomSafe, T: Codable>(_ value: T?, forKey key: String, safeType: S.Type) {
        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func getValue<T: Codable, S:StrongroomSafe>(forKey key: String, safeType: S.Type) -> T? {
        return getValue(forKey: key, safe: lazyLoadSafe(safeType))
    }
    
    public static func setValue<T:Codable>(_ value: T?, forKey key: String, safe: StrongroomSafe) {
        let archiver = CodableArchiver<T>();
        let data = archiver.archiveValue(value)
        safe.setData(data, forKey: key)
    }
    
    public static func getValue<T: Codable>(forKey key: String, safe: StrongroomSafe) -> T? {
        let archiver = CodableArchiver<T>();
        let data = safe.getData(forKey: key)
        return archiver.unarchiveValue(data: data)
    }
    
//    public static func setValue<S:StrongroomSafe>(_ value: Bool?, forKey key: String, safeType: S.Type) {
//        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
//    }
//
//    public static func setValue(_ value: Bool?, forKey key: String, safe: StrongroomSafe) {
//        storeValue(value, forKey: key, safe: safe)
//    }
//    
//    public static func setValue<S:StrongroomSafe>(_ value: String?, forKey key: String, safeType: S.Type) {
//        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
//    }
//
//    public static func setValue(_ value: String?, forKey key: String, safe: StrongroomSafe) {
//        storeValue(value, forKey: key, safe: safe)
//    }
//
//    public static func setValue<S:StrongroomSafe>(_ value: Int?, forKey key: String, safeType: S.Type) {
//        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
//    }
//
//    public static func setValue(_ value: Int?, forKey key: String, safe: StrongroomSafe) {
//        storeValue(value, forKey: key, safe: safe)
//    }
//
//    public static func setValue<S:StrongroomSafe>(_ value: Float?, forKey key: String, safeType: S.Type) {
//        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
//    }
//
//    public static func setValue(_ value: Float?, forKey key: String, safe: StrongroomSafe) {
//        storeValue(value, forKey: key, safe: safe)
//    }
//
//    public static func setValue<S:StrongroomSafe>(_ value: Double?, forKey key: String, safeType: S.Type) {
//        setValue(value, forKey: key, safe: lazyLoadSafe(safeType))
//    }
//
//    public static func setValue(_ value: Double?, forKey key: String, safe: StrongroomSafe) {
//        storeValue(value, forKey: key, safe: safe)
//    }
    
    public static func clearValues<S:StrongroomSafe>(safeType: S.Type) {
        clearValues(safe: lazyLoadSafe(safeType))
    }
    
    public static func clearValues(safe: StrongroomSafe) {
        safe.clearValues()
    }
}
