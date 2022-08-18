//
//  CDEmployee+CoreDataProperties.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 18/08/22.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var employeeId: String?
    @NSManaged public var fullName: String?
    @NSManaged public var email: String?
    @NSManaged public var isManager: Bool
    @NSManaged public var password: String?
    @NSManaged public var profilePicture: String?
    @NSManaged public var managerID: String?
    
    func convertToEmployee() -> Employee {
        return Employee(employeeId: self.employeeId!, fullName: self.fullName!, email: self.email!, isManager: self.isManager, password: self.password!, profilePicture: self.profilePicture!, managerID: self.managerID!)
    }

}

extension CDEmployee : Identifiable {

}
