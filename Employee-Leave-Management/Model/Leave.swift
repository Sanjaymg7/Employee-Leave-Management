//
//  Leave.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 11/08/22.
//

import Foundation

struct Leave:Codable{
    var fromDate:String
    var toDate:String
    var reason:String
    var requestorID:String
    var managerID:String
    var status:String
}
