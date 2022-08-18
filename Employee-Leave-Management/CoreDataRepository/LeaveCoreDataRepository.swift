//
//  LeaveCoreDataRepository.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 18/08/22.
//

import Foundation
import CoreData

struct LeaveCoreDataRepository {
    
    func createLeave(leave:Leave) -> Bool {
        
        let cdLeave = CDLeave(context: PersistentStorage.shared.context)
        
        cdLeave.leaveId = leave.leaveId
        cdLeave.fromDate = leave.fromDate
        cdLeave.toDate = leave.toDate
        cdLeave.reason = leave.reason
        cdLeave.requestorID = leave.requestorID
        cdLeave.requestorName = leave.requestorName
        cdLeave.managerID = leave.managerID
        cdLeave.status = leave.status.rawValue
        
        PersistentStorage.shared.saveContext()
        return true
        
    }
    
    func getAllLeaves() -> [Leave] {
        
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDLeave.self)
        
        var leaves:[Leave] = []
        
        result?.forEach({(cdleave) in
            leaves.append(cdleave.convertToLeave())
        })
        
        return leaves
        
    }
    
    func updateLeave(id:String,isAccepted:Bool) -> Bool {
        let resultLeave = getCDLeave(id: id)
        guard resultLeave != nil else {return false}
        resultLeave?.status = isAccepted ? LeaveStatus.accepted.rawValue : LeaveStatus.rejected.rawValue
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func deleteAllLeaves() {
        
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDLeave.self)
        
        result?.forEach({(cdleave) in
            PersistentStorage.shared.context.delete(cdleave)
        })
        
    }
    
    private func getCDLeave(id: String) -> CDLeave?{
        
            let fetchRequest = NSFetchRequest<CDLeave>(entityName: "CDLeave")
            let predicate = NSPredicate(format: "leaveId==%@", id as CVarArg)

            fetchRequest.predicate = predicate
            do {
                let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
                guard result != nil else {return nil}
                return result
            } catch let error {
                debugPrint(error)
            }

            return nil
        
        }
}
