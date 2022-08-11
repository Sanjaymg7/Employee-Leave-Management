//
//  ViewController.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 09/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //mainviewcontroller
    }


    @IBAction func emailButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let emailLoginViewController = storyBoard.instantiateViewController(withIdentifier: "emailLogin")
        emailLoginViewController.modalPresentationStyle = .fullScreen
        self.present(emailLoginViewController, animated:true, completion:nil)
    }
   
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let signUpViewController = storyBoard.instantiateViewController(withIdentifier: "signUp")
        signUpViewController.modalPresentationStyle = .fullScreen
        self.present(signUpViewController, animated:true, completion:nil)
    }
}

