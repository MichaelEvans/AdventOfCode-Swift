//
//  File.swift
//  
//
//  Created by Michael Evans on 12/1/20.
//

import Foundation
import XCTest
import AOC2020
import AOCCore

class Test2020 : XCTestCase {
    
    func testDay1() {
        let day = Day1()
        let (p1, p2) = day.solve()
        
        XCTAssertEqual(p1, "898299")
        XCTAssertEqual(p2, "143933922")
    }
    
    func testDay2() {
        let day = Day2()
        let (p1, p2) = day.solve()
        
        XCTAssertEqual(p1, "445")
        XCTAssertEqual(p2, "491")
    }
    
    func testDay3() {
        let day = Day3()
        let (p1, p2) = day.solve()
        
        XCTAssertEqual(p1, "280")
        XCTAssertEqual(p2, "4355551200")
    }
    
    func testDay4() {
        let day = Day4()
        let (p1, p2) = day.solve()
        
        XCTAssertEqual(p1, "192")
        XCTAssertEqual(p2, "101")
    }
    
    func testDay5() {
        let day = Day5()
        let (p1, p2) = day.solve()
        
        XCTAssertEqual(p1, "919")
        XCTAssertEqual(p2, "642")
    }
}
