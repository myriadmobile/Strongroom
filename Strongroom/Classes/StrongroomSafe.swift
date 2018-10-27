//
//  StrongroomSafe.swift
//  Pods-Strongroom_Example
//
//  Created by Jangle's MacBook Pro on 10/26/18.
//

import Foundation

public protocol StrongroomSafe {
    init();
    func setData(_ data: Data?, forKey key: String)
    func getData(forKey key: String) -> Data?
    func clearValues()
}
