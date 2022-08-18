//
//  EmployeeCoreDataRepository.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 18/08/22.
//

import Foundation

struct EmployeeCoreDataRepository {
    
    func createEmployee(employee:Employee) -> Bool {
        
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        
        cdEmployee.employeeId = employee.employeeId
        cdEmployee.fullName = employee.fullName
        cdEmployee.email = employee.email
        cdEmployee.isManager = employee.isManager
        cdEmployee.password = employee.password
        cdEmployee.profilePicture = employee.profilePicture
        cdEmployee.managerID = employee.managerID
        
        PersistentStorage.shared.saveContext()
        return true
        
    }
    
    func getAllEmployees() -> [Employee] {
        
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        
        var employees:[Employee] = []
        
        result?.forEach({(cdemployee) in
            employees.append(cdemployee.convertToEmployee())
        })
        
        return employees
        
    }
    
    func deleteAllEmployees() {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        result?.forEach({(cdemployee) in
            PersistentStorage.shared.context.delete(cdemployee)
        })
    }
    
}
