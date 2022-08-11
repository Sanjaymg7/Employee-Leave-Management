//
//  LeaveDataManager.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 11/08/22.
//

import Foundation
let leaveReuestDefaults = UserDefaults.standard
struct LeaveDataManager {
    
    func getAllLeaves() -> [Leave]{
        guard let leaveRequestSchemaData = leaveReuestDefaults.object(forKey: "leaveReuestDB") as? Data else{return []}
        do{
            let decoder = JSONDecoder()
            let leaveRequests = try decoder.decode([Leave].self, from: leaveRequestSchemaData)
            return leaveRequests
        }catch{
            return []
        }
                
    }

    func getLeavebyEmployeeId(employeeId:String)->[Leave]{
        let allLeaves = getAllLeaves()
        return allLeaves.filter({$0.requestorID==employeeId})
    }
    
    func getLeavebyManagerId(managerId:String)->[Leave]{
        let allLeaves = getAllLeaves()
        return allLeaves.filter({$0.managerID==managerId}).filter({$0.status.rawValue==LeaveStatus.applied.rawValue})
    }
   
    func postLeaves(_ leave:Leave){
        var leaves = getAllLeaves()
        leaves.append(leave)
        do{
            let encoder = JSONEncoder()
            let leaveReuestSchema = try encoder.encode(leaves)
            leaveReuestDefaults.setValue(leaveReuestSchema, forKey: "leaveReuestDB")
        }catch let err{
            print(err)
        }
    }

    
    mutating func leaveReuests(fromDate:String,toDate:String,reason:String,requestorID:String,managerID:String,status:String) -> Leave {
            let leave = Leave(fromDate: fromDate, toDate: toDate, reason: reason, requestorID:requestorID, managerID: managerID, status: LeaveStatus.applied)
        postLeaves(leave)
       return leave
        
    }
}

