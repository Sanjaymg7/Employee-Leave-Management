//
//  LoginViewController.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 10/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!

    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        let enteredEmail = userEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let enteredPassword = userPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if ((enteredEmail != "") && (enteredPassword != "")){
            if let employee = employeeDataManager.validateEmployee(email: enteredEmail!, password: enteredPassword!){
                currentEmployee = employee
                performSegue(withIdentifier: "HomePage", sender: self)
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
