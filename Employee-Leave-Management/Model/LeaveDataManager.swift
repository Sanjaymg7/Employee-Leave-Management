//
//  LeaveDataManager.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 11/08/22.
//

import Foundation

struct LeaveDataManager {
    
//    let appUserDefaults = UserDefaults.standard
    let leaveCoreDataRepository = LeaveCoreDataRepository()
    
    func removeAllLeaveRequests(){
//        appUserDefaults.removeObject(forKey: "leaveRequestDB")
        leaveCoreDataRepository.deleteAllLeaves()
    }

    func getLeavebyEmployeeId(employeeId:String) -> [Leave]{
//        let allLeaves:[Leave] = appUserDefaults.getAppData(dataKey: "leaveRequestDB")
        let allLeaves:[Leave] = leaveCoreDataRepository.getAllLeaves()
        return allLeaves.filter({$0.requestorID==employeeId})
    }
    
    func getLeavebyManagerId(managerId:String) -> [Leave]{
//        let allLeaves:[Leave] = appUserDefaults.getAppData(dataKey: "leaveRequestDB")
        let allLeaves:[Leave] = leaveCoreDataRepository.getAllLeaves()
        return allLeaves.filter({$0.managerID==managerId}).filter({$0.status==LeaveStatus.applied})
    }
    
    func leaveAction(leaveId:String, isAccepted:Bool) -> Bool{
        var isLeaveAvailable = false
//        var allLeaves:[Leave] = appUserDefaults.getAppData(dataKey: "leaveRequestDB")
        var allLeaves:[Leave] = leaveCoreDataRepository.getAllLeaves()
        for index in 0...allLeaves.count-1{
            if allLeaves[index].leaveId == leaveId{
                allLeaves[index].status = isAccepted ? LeaveStatus.accepted : LeaveStatus.rejected
                isLeaveAvailable = true
            }
        }
//        return isLeaveAvailable ? appUserDefaults.setAppData(data: allLeaves, dataKey: "leaveRequestDB") : false
//        return leaveCoreDataRepository.updateLeave(id: leaveId, isAccepted: isAccepted)
        return isLeaveAvailable ? leaveCoreDataRepository.updateLeave(id: leaveId, isAccepted: isAccepted) : false
        
    }
   
    func postLeaves(_ leave:Leave) -> Bool{
//        var leaves:[Leave] = appUserDefaults.getAppData(dataKey: "leaveRequestDB")
        var leaves:[Leave] = leaveCoreDataRepository.getAllLeaves()
        leaves.append(leave)
//        return appUserDefaults.setAppData(data: leaves, dataKey: "leaveRequestDB")
        return leaveCoreDataRepository.createLeave(leave: leave)
    }

    
    func leaveRequests(fromDate:String,toDate:String,reason:String,requestorID:String,managerID:String,status:String,requestorName:String) -> Leave?  {
        let leave = Leave(leaveId: "\(requestorID)\(managerID)\(Int.random(in: 1000...9999))", fromDate: fromDate, toDate: toDate, reason: reason, requestorID:requestorID, requestorName: requestorName, managerID: managerID, status: LeaveStatus.applied)
        let isLeaveCreated = postLeaves(leave)
        return isLeaveCreated ? leave : nil
    }
}

