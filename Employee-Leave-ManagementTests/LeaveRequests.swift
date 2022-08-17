//
//  EmployeeTests.swift
//  Employee-Leave-ManagementTests
//
//  Created by Yashwitha on 16/08/22.
//

import XCTest
@testable import Employee_Leave_Management

class EmployeeTests: XCTestCase {
    var leaveReuests:LeaveDataManager!
    
    override func setUp() {
        super.setUp()
        leaveReuests=LeaveDataManager()
    }
    override func tearDown() {
        leaveReuests=nil
        super.tearDown()
    }
    func test_craete_leaverequests()throws{
        XCTAssertNoThrow(try leaveReuests.leaveRequests(fromDate: "aug 20 2022", toDate: "aug 20 2022", reason: "sick", requestorID: "112", managerID: "114", status: "applied", requestorName: "yashwitha"))
    }
    func test_getLeaveby_employeeId()throws{
        XCTAssertNoThrow(try leaveReuests.getLeavebyEmployeeId(employeeId: "112"))
    }
    func test_getLeavebyManagerId() throws{
        XCTAssertNoThrow(try leaveReuests.getLeavebyManagerId(managerId: "114"))
    }
    func test_leaveAction() throws{
        XCTAssertNoThrow(try leaveReuests.leaveAction(leaveId: "112", isAccepted: true))
    }
//    func test_post_leaves() throws{
//        XCTAssertNoThrow(try leaveReuests.postLeaves(Leave(leaveId: "112", fromDate: "aug 20 2022", toDate: "aug 18 2022", reason: "sik", requestorID: "112", requestorName: "114", managerID: "114", status: "applied")))
//    }
}
