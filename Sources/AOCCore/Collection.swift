//
//  File.swift
//  
//
//  Created by Michael Evans on 12/5/20.
//

import Foundation

extension Collection {
    public func count(where test: (Element) throws -> Bool) rethrows -> Int {
        return try self.filter(test).count
    }
}
