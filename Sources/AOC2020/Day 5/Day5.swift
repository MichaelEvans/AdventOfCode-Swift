//
//  File.swift
//  
//
//  Created by Michael Evans on 12/2/20.
//

import Foundation
import AOCCore

public class Day5 : Day {
    
    let sampleInput = [
        "BFFFBBFRRR",
        "FFFBBBFRRR",
        "BBFFBBFRLL"
    ]
    
    public override func part1() -> String {
        let max = inputLines.map { (input) -> Seat in
            Seat(input)
        }.max { (a, b) -> Bool in
            a.seatId < b.seatId
        }!
        return String(max.seatId)
    }
    
    public override func part2() -> String {
        let seatIds = inputLines.map { (input) -> Int in
            Seat(input).seatId
        }.sorted { (a, b) -> Bool in
            a < b
        }
        
        let lowestId = seatIds.first!
        let highestId = seatIds.last!
        
        let actualSum = seatIds.reduce(0, +)
        let totalSum = (lowestId...highestId).reduce(0, +)
        return String(totalSum - actualSum)
    }
}

struct Seat {
    var row: Int
    var col: Int
    init(_ input: String) {
        let rowString = input.prefix(7).replacingOccurrences(of: "B", with: "1").replacingOccurrences(of: "F", with: "0")
        let colString = input.suffix(3).replacingOccurrences(of: "R", with: "1").replacingOccurrences(of: "L", with: "0")
        self.row = Int(rowString, radix: 2)!
        self.col = Int(colString, radix: 2)!
    }
    
    var seatId: Int {
        row * 8 + col
    }
}
