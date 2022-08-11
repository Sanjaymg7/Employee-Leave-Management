//
//  LoginViewController.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 10/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let emailLoginViewController = storyBoard.instantiateViewController(withIdentifier: "HomePage")
        emailLoginViewController.modalPresentationStyle = .fullScreen
        self.present(emailLoginViewController, animated:true, completion:nil)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
