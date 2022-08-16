//
//  EmployeeDataManager.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 11/08/22.
//

import UIKit

struct EmployeeDataManager {
    
    func getEmployeeById(employeeId:String)throws->Employee?{
        let employees:[Employee] = appUserDefaults.getAppData(dataKey: "employeeDB")
        let resultEmployee = employees.filter({$0.employeeId==employeeId})
        if resultEmployee.count == 1{
            return resultEmployee[0]
        }
        return nil
    }
    
    func removeAllUsers(){
        appUserDefaults.removeObject(forKey: "employeeDB")
    }
    
    func validateEmployee(email:String,password:String)throws->Employee?{
        let employees:[Employee] = appUserDefaults.getAppData(dataKey: "employeeDB")
        let reultEmployee = employees.filter({$0.email==email&&$0.password==password})
        if reultEmployee.count == 1{
            return reultEmployee[0]
        }
        return nil
    }
    
    func getManagerID() throws-> String{
        let employees:[Employee] = appUserDefaults.getAppData(dataKey: "employeeDB")
        let managers = employees.filter({$0.isManager})
        if managers.count>0{
            let randomInt = Int.random(in: 0...managers.count-1)
            return managers[randomInt].employeeId
        }
        return ""
    }
    
    func addEmployee(_ employee:Employee)throws->Bool{
        var employees:[Employee] = appUserDefaults.getAppData(dataKey: "employeeDB")
        employees.append(employee)
        return appUserDefaults.setAppData(data: employees, dataKey: "employeeDB")
    }
    
    mutating func createEmployee(fullName:String,email:String,password:String,profilePicture:UIImage,isManager:Bool)throws -> Employee? {
        let userID = "\(fullName)\(Int.random(in: 1000...9999))"
        if isManager{
            let manager = Employee(employeeId: userID, fullName: fullName, email: email, isManager: isManager, password: password, profilePicture: profilePicture.pngData()!, managerID: userID)
            let profileAdded = try addEmployee(manager)
            return profileAdded ? manager : nil
        }else{
            let managerID = try getManagerID()
            if managerID != ""{
                let employee = Employee(employeeId: userID, fullName: fullName, email: email, isManager: isManager, password: password, profilePicture: profilePicture.pngData()!, managerID: managerID)
                let profileAdded = try addEmployee(employee)
                return profileAdded ? employee : nil
            }else{
                let manager = Employee(employeeId: userID, fullName: fullName, email: email, isManager: true, password: password, profilePicture: profilePicture.pngData()!, managerID: userID)
                let profileAdded = try addEmployee(manager)
                return profileAdded ? manager : nil
            }
        }
    }
    
}
