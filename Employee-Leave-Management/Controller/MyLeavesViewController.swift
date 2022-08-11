//
//  MyLeavesViewController.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 11/08/22.
//

import UIKit

class MyLeavesViewController: UIViewController {
    @IBOutlet weak var table:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func BackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LogoutButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let HomePageViewController = storyBoard.instantiateViewController(withIdentifier: "MainPage")
        HomePageViewController.modalPresentationStyle = .fullScreen
        self.present(HomePageViewController, animated:true, completion:nil)
    }
}
