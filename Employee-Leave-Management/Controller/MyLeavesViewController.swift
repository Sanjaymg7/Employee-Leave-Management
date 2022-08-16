//
//  MyLeavesViewController.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 11/08/22.
//

import UIKit

class MyLeavesViewController: UIViewController {
    
    let leaveDataManager = LeaveDataManager()
    
    @IBOutlet weak var table:UITableView!
    var myLeaves:[Leave] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let employee = currentEmployee{
            myLeaves = leaveDataManager.getLeavebyEmployeeId(employeeId: employee.employeeId)
        }
    }
    

    @IBAction func BackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LogoutButtonPressed(_ sender: UIButton) {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
}
extension MyLeavesViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLeaves.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyLeavesCell = table.dequeueReusableCell(withIdentifier: "MyLeavesCell", for: indexPath) as! MyLeavesCell
        MyLeavesCell.fromDate.text = myLeaves[indexPath.row].fromDate
        MyLeavesCell.toDate.text = myLeaves[indexPath.row].toDate
        MyLeavesCell.reason.text = myLeaves[indexPath.row].reason
        MyLeavesCell.status.text = myLeaves[indexPath.row].status.rawValue
       return MyLeavesCell
    }

}
