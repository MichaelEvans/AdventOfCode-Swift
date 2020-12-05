//
//  Bool.swift
//  
//
//  Created by Michael Evans on 12/2/20.
//

import Foundation

extension Bool {
    public static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}
