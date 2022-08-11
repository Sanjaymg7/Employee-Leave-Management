//
//  LoginViewController.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 10/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let employeeDataManager = EmployeeDataManager()
    var employeeData:Employee?

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!

    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        let enteredEmail = userEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let enteredPassword = userPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if ((enteredEmail != "") && (enteredPassword != "")){
            if let employee = employeeDataManager.validateEmployee(email: enteredEmail!, password: enteredPassword!){
                employeeData = employee
                performSegue(withIdentifier: "HomePage", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "HomePage" {
                let destinationVC = segue.destination as! HomeViewController
                destinationVC.employee = employeeData
            }
        }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
