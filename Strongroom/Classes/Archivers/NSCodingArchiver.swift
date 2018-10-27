//
//  CodableArchiver.swift
//  Pods
//
//  Created by Jangle's MacBook Pro on 10/26/18.
//

import Foundation

public class NSCodingArchiver<T: NSCoding>: StrongroomArchiver {
    public func archiveValue(_ value: T?) -> Data? {
        guard let value = value else { return nil }
        return NSKeyedArchiver.archivedData(withRootObject: value)
    }
    
    public func unarchiveValue(data: Data?) -> T? {
        guard let data = data else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? T
    }
}
