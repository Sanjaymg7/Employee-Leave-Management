//
//  EmployeeDataManager.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 10/08/22.
//

import UIKit

let employeeUserDefaults = UserDefaults.standard

struct EmployeeDataManager {
    
    func getAllEmployees() -> [Employee] {
        guard let employeeSchemaData = employeeUserDefaults.object(forKey: "employeeDB") as? Data else{return []}
        do{
            let decoder = JSONDecoder()
            let employees = try decoder.decode([Employee].self, from: employeeSchemaData)
            return employees
        }catch{
            return []
        }
    }
    
    func getManagerID() -> String{
        let employees = getAllEmployees()
        let managers = employees.filter({$0.isManager})
        if managers.count>0{
            let randomInt = Int.random(in: 0...managers.count-1)
            return managers[randomInt].employeeId
        }
        return ""
    }
    
    func addEmployee(_ employee:Employee){
        var employees = getAllEmployees()
        employees.append(employee)
        do{
            let encoder = JSONEncoder()
            let employeeSchema = try encoder.encode(employees)
            employeeUserDefaults.setValue(employeeSchema, forKey: "employeeDB")
        }catch let err{
            print(err)
        }
    }
    
    mutating func createEmployee(fullName:String,email:String,password:String,profilePicture:UIImage,isManager:Bool) -> Employee {
        print("creating employee")
        let userID = "\(fullName)\(Int.random(in: 1000...9999))"
        if isManager{
            let manager = Employee(employeeId: userID, fullName: fullName, email: email, isManager: isManager, password: password, profilePicture: profilePicture.pngData()!, managerID: userID)
            addEmployee(manager)
            return manager
        }else{
            let managerID = getManagerID()
            if managerID != ""{
                let employee = Employee(employeeId: userID, fullName: fullName, email: email, isManager: isManager, password: password, profilePicture: profilePicture.pngData()!, managerID: managerID)
                addEmployee(employee)
                return employee
            }else{
                let manager = Employee(employeeId: userID, fullName: fullName, email: email, isManager: isManager, password: password, profilePicture: profilePicture.pngData()!, managerID: userID)
                addEmployee(manager)
                return manager
            }
        }
    }
    
}
