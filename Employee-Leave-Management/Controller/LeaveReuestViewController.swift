//
//  LeaveReuestViewController.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 11/08/22.
//

import UIKit

class LeaveReuestViewController: UIViewController {
    @IBOutlet weak var table:UITableView!
    var leaveDataManager = LeaveDataManager()
    var leaveRequests:[Leave] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let employee = currentEmployee{
            leaveRequests = leaveDataManager.getLeavebyManagerId(managerId: employee.employeeId)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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

extension LeaveReuestViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaveRequests.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leaveRequestCell = table.dequeueReusableCell(withIdentifier: "LeaveReuestCell", for: indexPath) as! LeaveRequestCell
        leaveRequestCell.userName.text = leaveRequests[indexPath.row].requestorName
        leaveRequestCell.fromDate.text = leaveRequests[indexPath.row].fromDate
        leaveRequestCell.toDate.text = leaveRequests[indexPath.row].toDate
        leaveRequestCell.reason.text = leaveRequests[indexPath.row].reason
        leaveRequestCell.acceptButton.tag = indexPath.row
        leaveRequestCell.acceptButton.addTarget(self, action: #selector(acceptLeaveRequest), for: .touchUpInside)
        leaveRequestCell.rejectButton.tag = indexPath.row
        leaveRequestCell.rejectButton.addTarget(self, action: #selector(rejectLeaveRequest), for: .touchUpInside)
        return leaveRequestCell
    }
    
    @objc func acceptLeaveRequest(sender:UIButton){
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let selectedLeave = leaveRequests[indexPath.row]
        print(selectedLeave)
    }
    
    @objc func rejectLeaveRequest(sender:UIButton){
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let selectedLeave = leaveRequests[indexPath.row]
        print(selectedLeave)
    }


}
