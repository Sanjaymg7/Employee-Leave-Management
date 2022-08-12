//
//  MyManagerViewController.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 10/08/22.
//

import UIKit

class MyManagerViewController: UIViewController {
    
    @IBOutlet weak var userWelcomeLabel: UILabel!
    @IBOutlet weak var managerNameLabel: UILabel!
    @IBOutlet weak var managerEmailLabel: UILabel!
    @IBOutlet weak var managerProfilePicture: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let employee = currentEmployee{
            userWelcomeLabel.text = "Welcome \(employee.fullName)"
            let employeeManager = employeeDataManager.getEmployeeById(employeeId: employee.managerID)
            if let manager = employeeManager{
                managerNameLabel.text = manager.fullName
                managerEmailLabel.text = manager.email
                managerProfilePicture.image = UIImage(data: manager.profilePicture)
            }
        }
    }
    

    @IBAction func BackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
  
    
}
