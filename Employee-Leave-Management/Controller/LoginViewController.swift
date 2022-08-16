//
//  LoginViewController.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 10/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let employeeDataManager = EmployeeDataManager()

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!

    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        let enteredEmail = userEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let enteredPassword = userPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if ((enteredEmail != "") && (enteredPassword != "")){
            if let employee = try!  employeeDataManager.validateEmployee(email: enteredEmail!, password: enteredPassword!){
                currentEmployee = employee
                performSegue(withIdentifier: "HomePage", sender: self)
            }else{
                let alert = UIAlertController(title: "Alert\n", message: "User Not Found!!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
