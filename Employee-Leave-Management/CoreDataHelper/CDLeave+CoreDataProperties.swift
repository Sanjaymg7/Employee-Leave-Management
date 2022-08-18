//
//  CDLeave+CoreDataProperties.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 18/08/22.
//
//

import Foundation
import CoreData


extension CDLeave {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDLeave> {
        return NSFetchRequest<CDLeave>(entityName: "CDLeave")
    }

    @NSManaged public var leaveId: String?
    @NSManaged public var fromDate: String?
    @NSManaged public var toDate: String?
    @NSManaged public var reason: String?
    @NSManaged public var requestorID: String?
    @NSManaged public var requestorName: String?
    @NSManaged public var managerID: String?
    @NSManaged public var status: String?
    
    func convertToLeave() -> Leave {
        return Leave(leaveId: self.leaveId!, fromDate: self.fromDate!, toDate: self.toDate!, reason: self.reason!, requestorID: self.requestorID!, requestorName: self.requestorName!, managerID: self.managerID!, status: LeaveStatus(rawValue: status!)!)
    }

}

extension CDLeave : Identifiable {

}
