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
        func test_Emplyoee_details(){
            let image = UIImage(named: "cartoon")!
            // create Employee
            let emplyoeedetail1 =  emplyoee.createEmployee(fullName: "yashwitha", email: "yashwitha@mail.com", password: "yash12", profilePicture:image , isManager: true)
            let emplyoeedetail2 =  emplyoee.createEmployee(fullName: "", email: "", password: "", profilePicture:UIImage() , isManager: true)
           XCTAssertNotNil(emplyoeedetail1)
            XCTAssertNil(emplyoeedetail2)
            
            // get Emplyoee_ID
            let employeeId="112"
            let empID =  emplyoee.getEmployeeById(employeeId: employeeId)
            XCTAssert(empID == nil)

            
        }
        
        func test_add_employee() {
            let image = UIImage(named: "cartoon")!
            let emplyoeedetail1 =  emplyoee.createEmployee(fullName: "angel", email: "angel@mail.com", password: "angel2", profilePicture:image , isManager: true)
            let emplyoeedetail2 =  emplyoee.createEmployee(fullName: "", email: "", password: "", profilePicture:UIImage() , isManager: true)
            let emp1 = (emplyoee.addEmployee(emplyoeedetail1!))
//            let emp2 = try(emplyoee.addEmployee(emplyoeedetail2!))
            XCTAssertNotNil(emp1)
//            XCTAssertNotNil(emp2)
           
        }
        
    }
