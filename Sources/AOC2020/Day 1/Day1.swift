//
//  File.swift
//  
//
//  Created by Michael Evans on 12/1/20.
//

import Foundation
import AOCCore

public class Day1 : Day {
    let sampleData = [
        1721,
        979,
        366,
        299,
        675,
        1456,
    ]
    
    public override func part1() -> String {
        for i in 0..<inputIntegers.count {
            for j in (i + 1)..<inputIntegers.count {
                if inputIntegers[i] + inputIntegers[j] == 2020 {
                    return "\(inputIntegers[i] * inputIntegers[j])"
                }
            }
        }
        return ""
    }
    
    public override func part2() -> String {
        for i in 0..<inputIntegers.count {
            for j in (i + 1)..<inputIntegers.count {
                for k in (j + 1)..<inputIntegers.count {
                    if inputIntegers[i] + inputIntegers[j] + inputIntegers[k] == 2020 {
                        return "\(inputIntegers[i] * inputIntegers[j] * inputIntegers[k])"
                    }
                }
            }
        }
        return "0"
    }
}
