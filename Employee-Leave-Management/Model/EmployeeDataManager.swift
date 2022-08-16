//
//  EmployeeDataManager.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 11/08/22.
//

import UIKit

struct EmployeeDataManager {
    
    let imageService = ImageService()
    let appUserDefaults = UserDefaults.standard
    
    func getEmployeeById(employeeId:String)->Employee?{
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
    
    func validateEmployee(email:String,password:String)->Employee?{
        let employees:[Employee] = appUserDefaults.getAppData(dataKey: "employeeDB")
        let reultEmployee = employees.filter({$0.email==email&&$0.password==password})
        if reultEmployee.count == 1{
            return reultEmployee[0]
        }
        return nil
    }
    
    func getManagerID() -> String{
        let employees:[Employee] = appUserDefaults.getAppData(dataKey: "employeeDB")
        let managers = employees.filter({$0.isManager})
        if managers.count>0{
            let randomInt = Int.random(in: 0...managers.count-1)
            return managers[randomInt].employeeId
        }
        return ""
    }
    
    func addEmployee(_ employee:Employee)->Bool{
        var employees:[Employee] = appUserDefaults.getAppData(dataKey: "employeeDB")
        employees.append(employee)
        return appUserDefaults.setAppData(data: employees, dataKey: "employeeDB")
    }
    
    func createEmployee(fullName:String,email:String,password:String,profilePicture:UIImage,isManager:Bool) -> Employee? {
        let userID = "\(fullName)\(Int.random(in: 1000...9999))"
        let profilePicName = "\(userID).png"
        let filePath = imageService.saveImage(image: profilePicture, fileName: profilePicName)
        if let _ = filePath{
            if isManager{
                let manager = Employee(employeeId: userID, fullName: fullName, email: email, isManager: isManager, password: password, profilePicture: profilePicName, managerID: userID)
                let profileAdded = addEmployee(manager)
                return profileAdded ? manager : nil
            }else{
                let managerID = getManagerID()
                if managerID != ""{
                    let employee = Employee(employeeId: userID, fullName: fullName, email: email, isManager: isManager, password: password, profilePicture: profilePicName, managerID: managerID)
                    let profileAdded = addEmployee(employee)
                    return profileAdded ? employee : nil
                }else{
                    let manager = Employee(employeeId: userID, fullName: fullName, email: email, isManager: true, password: password, profilePicture: profilePicName, managerID: userID)
                    let profileAdded = addEmployee(manager)
                    return profileAdded ? manager : nil
                }
            }
        }
        return nil
    }
    
}
