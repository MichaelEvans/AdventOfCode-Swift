//
//  File.swift
//  
//
//  Created by Michael Evans on 12/2/20.
//

import Foundation
import AOCCore

public class Day3 : Day {
    
    func findTreesInPath(_ xOffset: Int, _ yOffset: Int) -> Int {
        var xPosition = 0
        var treesHit = 0
        for i in stride(from: 0, to: inputLines.count, by: yOffset) {
            print(i)
            let row = inputLines[i]
            if (row[xPosition].isTree()) {
                treesHit += 1
            }
            xPosition = (xPosition + xOffset) % row.count
        }
        return treesHit
    }
    
    public override func part1() -> String {
        let treesHit = findTreesInPath(3, 1)
        return String(treesHit)
    }
    
    public override func part2() -> String {
        let slopes = [
            (1, 1),
            (3, 1),
            (5, 1),
            (7, 1),
            (1, 2)
        ]
        let treesHit = slopes.map { x, y -> Int in
            return findTreesInPath(x, y)
        }.reduce(1, *)
        return String(treesHit)

    }
}

extension Character {
    func isTree() -> Bool {
        return self == "#"
    }
}
