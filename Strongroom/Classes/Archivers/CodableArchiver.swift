//
//  CodableArchiver.swift
//  Pods
//
//  Created by Jangle's MacBook Pro on 10/26/18.
//

import Foundation

public class CodableArchiver<T: Codable>: StrongroomArchiver {
    typealias CodableDictionary = [String: T]
    
    public func archiveValue(_ value: T?) -> Data? {
        guard let value = value else { return nil }
        let dictionary: CodableDictionary = ["": value] // JSONEncoder requires a dictionary
        return try? JSONEncoder().encode(dictionary)
    }
    
    public func unarchiveValue(data: Data?) -> T? {
        guard let data = data else { return nil }
        let dictionary = try? JSONDecoder().decode(CodableDictionary.self, from: data)
        return dictionary?[""]
    }
}
