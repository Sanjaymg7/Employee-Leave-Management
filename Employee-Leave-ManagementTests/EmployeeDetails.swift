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
        var  appUserDefaults = UserDefaults.standard
        
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
            let e      mplyoeedetail2 =  emplyoee.createEmployee(fullName: "", email: "", password: "", profilePicture:UIImage() , isManager: true)
            // get the emplyoee total counts
            let emp:[Employee] = appUserDefaults.getAppData(dataKey: "employeeDB")
            appUserDefaults.removeObject(forKey: "employeeDB")
            XCTAssertGreaterThan(emp.count, 0)
            XCTAssertNotNil(emplyoeedetail1)
            XCTAssertNil(emplyoeedetail2)
           
        }
        
        func test_add_employee() {
            let image = UIImage(named: "cartoon")!
            let emplyoeedetail1 =  emplyoee.createEmployee(fullName: "angel", email: "angel@mail.com", password: "angel2", profilePicture:image , isManager: true)
            // check the emplyoee is manager or not
            if(emplyoeedetail1?.isManager==true){
                XCTAssert(true)
            }
            let emp1 = (emplyoee.addEmployee(emplyoeedetail1!))
            XCTAssert(emp1)
           
        
        }
        
    }
