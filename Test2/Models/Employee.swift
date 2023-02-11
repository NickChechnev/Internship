//
//  Employee.swift
//  Test2
//
//  Created by Никита Чечнев on 05.02.2023.
//

import Foundation

struct Employees: Codable{
    let company: Company
}

struct Company: Codable {
    let name: String
    let employees: [Employee]
}

struct Employee: Codable, Hashable {
    let name: String
    let phoneNumber: String
    let skills: [String]
    
    var skillsString: String {
        return skills.joined(separator: ", ")
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
