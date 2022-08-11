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
    var employee:Employee?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentEmployee = employee{
            welcomeUserLabel.text = "Welcome \(currentEmployee.fullName)"
            if !currentEmployee.isManager{
                leaveRequestButton.isHidden = true
            }
        }
    }
    

    
    @IBAction func ApplyLeaveButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ApplyLeavePage", sender: self)
    }
    
   
    @IBAction func MyLeaveButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "MyLeavesPage", sender: self)
    }
    
    @IBAction func MyManagerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "MyManagerPage", sender: self)
    }
    
    @IBAction func LeaveRequestsButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "LeaveRequestsPage", sender: self)
    }
    
    @IBAction func LogoutButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let LeaveRequestsViewController = storyBoard.instantiateViewController(withIdentifier: "MainPage")
        LeaveRequestsViewController.modalPresentationStyle = .fullScreen
        self.present(LeaveRequestsViewController, animated:true, completion:nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ApplyLeavePage" {
                let destinationVC = segue.destination as! ApplyLeavesViewController
                if let currentEmployee = employee{
                    destinationVC.employee = currentEmployee
                }
            }else if segue.identifier == "MyLeavesPage" {
                let destinationVC = segue.destination as! MyLeavesTableViewController
                if let currentEmployee = employee{
                    destinationVC.employee = currentEmployee
                }
            }else if segue.identifier == "MyManagerPage" {
                let destinationVC = segue.destination as! MyManagerViewController
                if let currentEmployee = employee{
                    destinationVC.employee = currentEmployee
                }
            }else if segue.identifier == "LeaveRequestsPage" {
                let destinationVC = segue.destination as! LeaveRequestTableViewController
                if let currentEmployee = employee{
                    destinationVC.employee = currentEmployee
                }
            }
        }
    
}
