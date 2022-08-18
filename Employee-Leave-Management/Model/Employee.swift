//
//  Employee.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 11/08/22.
//

import UIKit

struct Employee:Codable {
    var employeeId:String
    var fullName:String
    var email:String
    var isManager:Bool
    var password:String
    var profilePicture:String
    var managerID:String
    
}
