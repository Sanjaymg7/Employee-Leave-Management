//
//  LeaveDataManager.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 11/08/22.
//

import Foundation

struct LeaveDataManager {
    
    let appUserDefaults = UserDefaults.standard
    
    func removeAllLeaveRequests(){
        appUserDefaults.removeObject(forKey: "leaveRequestDB")
    }

    func getLeavebyEmployeeId(employeeId:String)->[Leave]{
        let allLeaves:[Leave] = appUserDefaults.getAppData(dataKey: "leaveRequestDB")
        return allLeaves.filter({$0.requestorID==employeeId})
    }
    
    func getLeavebyManagerId(managerId:String)->[Leave]{
        let allLeaves:[Leave] = appUserDefaults.getAppData(dataKey: "leaveRequestDB")
        return allLeaves.filter({$0.managerID==managerId}).filter({$0.status==LeaveStatus.applied})
    }
    
    func leaveAction(leaveId:String, isAccepted:Bool)->Bool{
        var allLeaves:[Leave] = appUserDefaults.getAppData(dataKey: "leaveRequestDB")
        for index in 0...allLeaves.count-1{
            if allLeaves[index].leaveId == leaveId{
                allLeaves[index].status = isAccepted ? LeaveStatus.accepted : LeaveStatus.rejected
            }
        }
        return appUserDefaults.setAppData(data: allLeaves, dataKey: "leaveRequestDB")
    }
   
    func postLeaves(_ leave:Leave) -> Bool{
        var leaves:[Leave] = appUserDefaults.getAppData(dataKey: "leaveRequestDB")
        leaves.append(leave)
        return appUserDefaults.setAppData(data: leaves, dataKey: "leaveRequestDB")
    }

    
    mutating func leaveRequests(fromDate:String,toDate:String,reason:String,requestorID:String,managerID:String,status:String,requestorName:String) -> Leave?  {
        let leave = Leave(leaveId: "\(requestorID)\(managerID)\(Int.random(in: 1000...9999))", fromDate: fromDate, toDate: toDate, reason: reason, requestorID:requestorID, requestorName: requestorName, managerID: managerID, status: LeaveStatus.applied)
        let isLeaveCreated = postLeaves(leave)
        return isLeaveCreated ? leave : nil
    }
}

