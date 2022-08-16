//
//  EmployeeDetails.swift
//  Employee-Leave-ManagementTests
//
//  Created by Yashwitha on 16/08/22.
//

import XCTest
@testable import Employee_Leave_Management
class EmployeeDetails: XCTestCase {

        var emplyoee:EmployeeDataManager!
        
        override func setUp() {
            super.setUp()
            emplyoee=EmployeeDataManager()
        }
        override func tearDown() {
            emplyoee=nil
            super.tearDown()
        }
        func test_create_employee()throws{
            XCTAssertNoThrow(try emplyoee.createEmployee(fullName: "yashwitha", email: "yashwitha@mail.com", password: "yash12", profilePicture: UIImage(named: "img.png")!, isManager: true))
        }
        func test_get_employeeById()throws{
            XCTAssertNoThrow(try emplyoee.getEmployeeById(employeeId: "112"))
        }
        func test_get_managerID() throws{
            XCTAssertNoThrow(try emplyoee.getManagerID())
        }
//        func test_add_employee() throws{
//            XCTAssertNoThrow(try emplyoee.addEmployee(Employee(employeeId: "112", fullName: "yashwitha", email: "yashwitha@mail.com", isManager: true, password: "yash12", profilePicture: UIImage(named: "img.png")! , managerID: "112")))
//        }
        func test_validateEmployee() throws{
            XCTAssertNoThrow(try emplyoee.validateEmployee(email: "yashwitha@mail.com", password: "yash12"))
        }
    }
