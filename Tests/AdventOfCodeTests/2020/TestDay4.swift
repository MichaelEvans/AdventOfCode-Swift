//
//  File.swift
//  
//
//  Created by Michael Evans on 12/5/20.
//

import Foundation
import XCTest
import AOC2020
import AOCCore

class TestDay4 : XCTestCase {
 
    func testCountryIdIsNotMandatory() {
        let field = Field("cid", "123")
        XCTAssertFalse(field.isMandatory())
    }
    
    func testMandatoryFields() {
        let mandatoryFields = [
            "byr": "1988",
            "iyr": "2015",
            "eyr": "2025",
            "hgt": "71in",
            "hcl": "#000000",
            "ecl": "brn",
            "pid": "123456789"
        ]
        mandatoryFields.forEach { (k, v) in
            let field = Field(k, v)
            XCTAssertTrue(field.isMandatory())
        }
    }
    
    func testPassportHasAllRequiredFields() {
        let input = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm"
        let passport = Passport(input.toFields())
        XCTAssertTrue(passport.hasRequiredFields())
    }
    
    func testPassportMissingRequiredFields() {
        let input = "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884 hcl:#cfa07d byr:1929"
        let passport = Passport(input.toFields())
        XCTAssertFalse(passport.hasRequiredFields())
    }
    
    func testPassportMissingCountryIdStillHasAllRequiredFields() {
        let input = "hcl:#ae17e1 iyr:2013 eyr:2024 ecl:brn pid:760753108 byr:1931 hgt:179cm"
        let passport = Passport(input.toFields())
        XCTAssertTrue(passport.hasRequiredFields())
    }
    
    func testBirthYear() {
        var field = Field("byr", "2002")
        XCTAssertTrue(field.isValid())
        
        field = Field("byr", "2003")
        XCTAssertFalse(field.isValid())
    }
    
    func testIssueYear() {
        var field = Field("iyr", "2020")
        XCTAssertTrue(field.isValid())
        
        field = Field("iyr", "2021")
        XCTAssertFalse(field.isValid())
    }
    
    func testExpirationYear() {
        var field = Field("eyr", "2030")
        XCTAssertTrue(field.isValid())
        
        field = Field("eyr", "2031")
        XCTAssertFalse(field.isValid())
    }
    
    func testHeight() {
        var field = Field("hgt", "60in")
        XCTAssertTrue(field.isValid())
        
        field = Field("hgt", "190cm")
        XCTAssertTrue(field.isValid())
        
        field = Field("hgt", "190in")
        XCTAssertFalse(field.isValid())
        
        field = Field("hgt", "190")
        XCTAssertFalse(field.isValid())
    }
    
    func testHairColor() {
        var field = Field("hcl", "#123abc")
        XCTAssertTrue(field.isValid())
        
        field = Field("hcl", "#123abz")
        XCTAssertFalse(field.isValid())
        
        field = Field("hcl", "123abc")
        XCTAssertFalse(field.isValid())
    }
    
    func testEyeColor() {
        var field = Field("ecl", "brn")
        XCTAssertTrue(field.isValid())
        
        field = Field("ecl", "wat")
        XCTAssertFalse(field.isValid())
    }
    
    func testPassportId() {
        var field = Field("pid", "000000001")
        XCTAssertTrue(field.isValid())
        
        field = Field("pid", "0123456789")
        XCTAssertFalse(field.isValid())
    }
}
