//
//  LeaveDataManager.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 11/08/22.
//

import Foundation

let leaveRequestDefaults = UserDefaults.standard

struct LeaveDataManager {
    
    func setLeaveData(leaveData:[Leave]) -> Bool{
        do{
            let encoder = JSONEncoder()
            let leaveRequestSchemaData = try encoder.encode(leaveData)
            leaveRequestDefaults.setValue(leaveRequestSchemaData, forKey: "leaveRequestDB")
            return true
        }catch{
            return false
        }
    }
    
    func getAllLeaves() -> [Leave]{
        guard let leaveRequestSchemaData = leaveRequestDefaults.object(forKey: "leaveRequestDB") as? Data else{return []}
        do{
            let decoder = JSONDecoder()
            let leaveRequests = try decoder.decode([Leave].self, from: leaveRequestSchemaData)
            return leaveRequests
        }catch{
            return []
        }
                
    }
    
    func removeAllLeaveRequests(){
        leaveRequestDefaults.removeObject(forKey: "leaveRequestDB")
    }

    func getLeavebyEmployeeId(employeeId:String)->[Leave]{
        let allLeaves = getAllLeaves()
        return allLeaves.filter({$0.requestorID==employeeId})
    }
    
    func getLeavebyManagerId(managerId:String)->[Leave]{
        let allLeaves = getAllLeaves()
        return allLeaves.filter({$0.managerID==managerId}).filter({$0.status==LeaveStatus.applied.rawValue})
    }
    
    func leaveAction(leaveId:String, isAccepted:Bool){
        var allLeaves = getAllLeaves()
        for index in 0...allLeaves.count-1{
            if allLeaves[index].leaveId == leaveId{
                allLeaves[index].status = isAccepted ? LeaveStatus.accepted.rawValue : LeaveStatus.rejected.rawValue
            }
        }
        let _ = setLeaveData(leaveData: allLeaves)
    }
   
    func postLeaves(_ leave:Leave) -> Bool{
        var leaves = getAllLeaves()
        leaves.append(leave)
        return setLeaveData(leaveData: leaves)
    }

    
    mutating func leaveRequests(fromDate:String,toDate:String,reason:String,requestorID:String,managerID:String,status:String,requestorName:String) -> Leave?  {
        let leave = Leave(leaveId: "\(requestorID)\(managerID)\(Int.random(in: 1000...9999))", fromDate: fromDate, toDate: toDate, reason: reason, requestorID:requestorID, requestorName: requestorName, managerID: managerID, status: LeaveStatus.applied.rawValue)
        let isLeaveCreated = postLeaves(leave)
        return isLeaveCreated ? leave : nil
    }
}

