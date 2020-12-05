//
//  File.swift
//  
//
//  Created by Michael Evans on 12/1/20.
//

import Foundation
import AOCCore

public class Day2 : Day {
    
    let sampleInput = [
        "1-3 a: abcde",
        "1-3 b: cdefg",
        "2-9 c: ccccccccc"
    ]
    
    public override func part1() -> String {
        let value = inputLines.compactMap { (line) -> InputData? in
            parseInput(line)
        }.filter { (input) -> Bool in
            let characterMap = input.password.toCharacterMap()
            let count = characterMap[input.requirement, default: 0]
            return (input.start...input.end).contains(count)
        }.count
        return String(value)
    }
    
    public override func part2() -> String {
        let count = inputLines.compactMap { (line) -> InputData? in
            parseInput(line)
        }.filter { (input) -> Bool in
            let firstPosition = input.password[input.start-1]
            let secondPosition = input.password[input.end-1]
            return (firstPosition == input.requirement) ^ (secondPosition == input.requirement)
        }.count
        return String(count)
    }
    
    private func parseInput(_ input: String) -> InputData? {
        let pattern = #"(?<start>\d+)-(?<end>\d+) (?<requirement>\w+): (?<password>\w+)"#
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        if let match = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count)) {
            let start = Int(input.substring(with: match.range(withName: "start"))!)!
            let end = Int(input.substring(with: match.range(withName: "end"))!)!
            let requirement = String(input.substring(with: match.range(withName: "requirement"))!)[0]
            let password = String(input.substring(with: match.range(withName: "password"))!)
            return InputData(start: start, end: end, requirement: requirement, password: password)
        }
        return nil
    }
}

struct InputData {
    let start: Int
    let end: Int
    let requirement: Character
    let password: String
}

extension String {
    func substring(with nsrange: NSRange) -> Substring? {
        guard let range = Range(nsrange, in: self) else {
            return nil
        }
        return self[range]
    }
    
    func toCharacterMap() -> Dictionary<Character, Int> {
        let tuples = self.map {
            ($0, 1)
        }
        return Dictionary(tuples, uniquingKeysWith: +)
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
