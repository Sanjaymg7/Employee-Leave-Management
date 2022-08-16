//
//  EmployeeDataManager.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 11/08/22.
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
    
    func getEmployeeById(employeeId:String)->Employee?{
        let employees = getAllEmployees()
        let resultEmployee = employees.filter({$0.employeeId==employeeId})
        if resultEmployee.count == 1{
            return resultEmployee[0]
        }
        return nil
    }
    
    func validateEmployee(email:String,password:String)->Employee?{
        let employees = getAllEmployees()
        let reultEmployee = employees.filter({$0.email==email&&$0.password==password})
        if reultEmployee.count == 1{
            return reultEmployee[0]
        }
        return nil
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
    
    func addEmployee(_ employee:Employee)->Bool{
        var employees = getAllEmployees()
        employees.append(employee)
        do{
            let encoder = JSONEncoder()
            let employeeSchema = try encoder.encode(employees)
            employeeUserDefaults.setValue(employeeSchema, forKey: "employeeDB")
            return true
        }catch{
            return false
        }
    }
    
    mutating func createEmployee(fullName:String,email:String,password:String,profilePicture:UIImage,isManager:Bool) -> Employee? {
        print("creating employee")
        let userID = "\(fullName)\(Int.random(in: 1000...9999))"
        if isManager{
            let manager = Employee(employeeId: userID, fullName: fullName, email: email, isManager: isManager, password: password, profilePicture: profilePicture.pngData()!, managerID: userID)
            let profileAdded = addEmployee(manager)
            return profileAdded ? manager : nil
        }else{
            let managerID = getManagerID()
            if managerID != ""{
                let employee = Employee(employeeId: userID, fullName: fullName, email: email, isManager: isManager, password: password, profilePicture: profilePicture.pngData()!, managerID: managerID)
                let profileAdded = addEmployee(employee)
                return profileAdded ? employee : nil
            }else{
                let manager = Employee(employeeId: userID, fullName: fullName, email: email, isManager: true, password: password, profilePicture: profilePicture.pngData()!, managerID: userID)
                let profileAdded = addEmployee(manager)
                return profileAdded ? manager : nil
            }
        }
    }
    
}
