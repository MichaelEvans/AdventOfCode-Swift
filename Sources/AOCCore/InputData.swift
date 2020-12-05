//
//  InputData.swift
//  Created by Arthur Dexter on 12/3/19.
//

import Foundation

public func readInputData(codePath: String = #file) throws -> Data {
    let url = inputUrl(codePath: codePath)
    return try Data(contentsOf: url)
}

public func readInput(codePath: String = #file) throws -> String {
    let url = inputUrl(codePath: codePath)
    return try String(contentsOf: url).trimmingCharacters(in: .whitespacesAndNewlines)
}

public func inputUrl(codePath: String = #file) -> URL {
    let codeUrl = URL(fileURLWithPath: codePath)
    return codeUrl
        .deletingPathExtension()
        .appendingPathExtension("txt")
}
