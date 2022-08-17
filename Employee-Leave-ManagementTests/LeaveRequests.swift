//
//  EmployeeTests.swift
//  Employee-Leave-ManagementTests
//
//  Created by Yashwitha on 16/08/22.
//

import XCTest
@testable import Employee_Leave_Management

class EmployeeTests: XCTestCase {
    var leaveRequests:LeaveDataManager!
    
    override func setUp() {
        super.setUp()
        leaveRequests=LeaveDataManager()
    }
    
    override func tearDown() {
        super.tearDown()
        leaveRequests=nil
    }
    
    func test_leaveRequest(){
        let leave = leaveRequests.leaveRequests(fromDate: "aug 20 2022", toDate: "aug 21 2022", reason: "Vacation", requestorID: "sanjay1234", managerID: "sanjay1234", status: LeaveStatus.applied.rawValue, requestorName: "Sanjay")
        XCTAssertNotNil(leave)
        XCTAssertEqual(leave?.reason, "Vacation")
    }
    
    func test_getLeaveByEmployeeId(){
        let employeeLeave = leaveRequests.getLeavebyEmployeeId(employeeId: "sanjay1234")
        XCTAssertGreaterThan(employeeLeave.count, 0)
        XCTAssertEqual(leaveRequests.getLeavebyEmployeeId(employeeId: "123").count, 0)
    }
    
    func test_getLeaveByManagerId(){
        XCTAssertGreaterThan(leaveRequests.getLeavebyManagerId(managerId: "sanjay1234").count, 0)
        XCTAssertEqual(leaveRequests.getLeavebyManagerId(managerId: "123").count, 0)
    }
    
    func test_leaveAction(){
        XCTAssertTrue(leaveRequests.leaveAction(leaveId: "sanjay1234sanjay12344645", isAccepted: true))
        XCTAssertFalse(leaveRequests.leaveAction(leaveId: "12", isAccepted: true))
    }
    
}
