//
//  HomeViewController.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 10/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func ApplyLeaveButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let ApplyLeaveViewController = storyBoard.instantiateViewController(withIdentifier: "applyLeave")
        ApplyLeaveViewController.modalPresentationStyle = .fullScreen
        self.present(ApplyLeaveViewController, animated:true, completion:nil)
    }
    
   
    @IBAction func MyLeaveButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let MyLeaveViewController = storyBoard.instantiateViewController(withIdentifier: "myLeaves")
        MyLeaveViewController.modalPresentationStyle = .fullScreen
        self.present(MyLeaveViewController, animated:true, completion:nil)
    }
    
    @IBAction func MyManagerButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let MyManagerViewController = storyBoard.instantiateViewController(withIdentifier: "managerDetails")
        MyManagerViewController.modalPresentationStyle = .fullScreen
        self.present(MyManagerViewController, animated:true, completion:nil)
    }
    
    @IBAction func LeaveRequestsButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let LeaveRequestsViewController = storyBoard.instantiateViewController(withIdentifier: "leaveRequests")
        LeaveRequestsViewController.modalPresentationStyle = .fullScreen
        self.present(LeaveRequestsViewController, animated:true, completion:nil)
    }
}
