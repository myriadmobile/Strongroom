//
//  StrongroomArchiver.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/26/18.
//

import Foundation

public protocol StrongroomArchiver {
    associatedtype T
    func archiveValue(_ value: T?) -> Data?
    func unarchiveValue(data: Data?) -> T?
}
