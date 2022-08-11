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
        let HomePageViewController = storyBoard.instantiateViewController(withIdentifier: "MainPage")
        HomePageViewController.modalPresentationStyle = .fullScreen
        self.present(HomePageViewController, animated:true, completion:nil)
    }
    
}
