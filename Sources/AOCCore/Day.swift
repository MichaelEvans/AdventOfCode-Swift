//
//  File.swift
//  
//
//  Created by Michael Evans on 12/1/20.
//

import Foundation

open class Day {
    
    private lazy var inputURL: URL? = {
            return url(withFileName: "input.txt")
    }()
    
    private func url(withFileName fileName: String) -> URL? {
        let className = String(cString: class_getName(type(of: self)))
        let groups = try! className.firstMatch(withPattern: #"AOC(\d{4}).Day(\d+)"#)
        var dir = URL(fileURLWithPath: "\(#file)").deletingLastPathComponent().deletingLastPathComponent()
        dir.appendPathComponent("AOC\(groups[1])")
        dir.appendPathComponent("Day \(groups[2])")
        dir.appendPathComponent(fileName)
        print(dir)
        return dir
    }

    public lazy var inputString: String = {
        guard
            let url = inputURL,
            let input = FileManager.default.contents(atPath: url.path),
            let string = String(data: input, encoding: .utf8)
            else { return "" }

        return string.trimmingCharacters(in: .whitespacesAndNewlines)
    }()

    public lazy var inputLines: [String] = {
        return inputString
            .components(separatedBy: .newlines)
            .compactMap({ line in
                let line = line.trimmingCharacters(in: .whitespaces)
                return line.isEmpty ? nil : line
            })
    }()

    public lazy var inputIntegers: [Int] = {
        return inputLines.compactMap({ Int($0) })
    }()
    
    public init() {
        
    }
    open func solve() -> (String, String) {
        return autoreleasepool {
            (part1(), part2())
        }
    }
    
    open func part1() -> String { fatalError("Not implemented") }
    open func part2() -> String { fatalError("Not implemented") }
}
