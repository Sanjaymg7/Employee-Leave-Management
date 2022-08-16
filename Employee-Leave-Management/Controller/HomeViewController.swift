//
//  HomeViewController.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 10/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var leaveRequestButton: UIButton!
    @IBOutlet weak var welcomeUserLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let employee = currentEmployee{
            welcomeUserLabel.text = "Welcome \(employee.fullName)"
            if !employee.isManager{
                leaveRequestButton.isHidden = true
            }
        }
    }
    
    @IBAction func LogoutButtonPressed(_ sender: UIButton) {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
}
