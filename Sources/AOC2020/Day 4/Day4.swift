//
//  File.swift
//  
//
//  Created by Michael Evans on 12/2/20.
//

import Foundation
import AOCCore

public class Day4 : Day {
    
    let sampleInput = """
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm

        iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
        hcl:#cfa07d byr:1929

        hcl:#ae17e1 iyr:2013
        eyr:2024
        ecl:brn pid:760753108 byr:1931
        hgt:179cm

        hcl:#cfa07d eyr:2025 pid:166559648
        iyr:2011 ecl:brn hgt:59in
    """
    
    public override func part1() -> String {
        let passports = inputString.components(separatedBy: "\n\n").map { line -> String in
            line.replacingOccurrences(of: "\n", with: " ")
        }.map {
            Passport($0.toFields())
        }.count { passport -> Bool in
            passport.hasRequiredFields()
        }
        return String(passports)
    }
    
    public override func part2() -> String {
        let passports = inputString.components(separatedBy: "\n\n").map { line -> String in
            line.replacingOccurrences(of: "\n", with: " ")
        }.map {
            Passport($0.toFields())
        }
        
        return String(passports.count { $0.isValid() })
    }
}

public struct Passport {
    let fields: Set<Field>
    
    public init(_ fields: Set<Field>) {
        self.fields = fields
    }
    
    public func hasRequiredFields() -> Bool {
        return self.fields.count { field -> Bool in
            field.isMandatory()
        } == 7
    }
    
    public func isValid() -> Bool {
        return hasRequiredFields() && fields.allSatisfy{ $0.isValid() }
    }
}

public struct Field : Hashable {
    let name: String
    let value: String
    
    public init(_ name: String, _ value: String) {
        self.name = name
        self.value = value
    }
    
    public func isMandatory() -> Bool {
        return name != "cid"
    }
    
    public func isValid() -> Bool {
        switch name {
            case "byr":
                return (1920...2002).contains(Int(value)!)
            case "iyr":
                return (2010...2020).contains(Int(value)!)
            case "eyr":
                return (2020...2030).contains(Int(value)!)
            case "hgt":
                let (count, unit) = (value.prefix(value.count - 2), value.suffix(2))
                switch unit {
                    case "in":
                        return (59...76).contains(Int(count)!)
                    case "cm":
                        return (150...193).contains(Int(count)!)
                    default:
                        return false
                }
            case "hcl":
                return value.matches("^#[0-9a-f]{6}$")
            case "ecl":
                return ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(value)
            case "pid":
                return value.matches("^\\d{9}$")
            default:
                return true
        }
    }
}

extension String {
    public func toFields() -> Set<Field> {
        Set(self.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
            .map {
                let parts = $0.components(separatedBy: ":")
                return Field(parts.first!, parts.last!)
            })
    }
}
