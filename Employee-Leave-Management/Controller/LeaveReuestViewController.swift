//
//  LeaveReuestViewController.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 11/08/22.
//

import UIKit

class LeaveReuestViewController: UIViewController {
    
    @IBOutlet weak var table:UITableView!
    var leaveRequests:[Leave] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let employee = currentEmployee{
            leaveRequests = leaveDataManager.getLeavebyManagerId(managerId: employee.employeeId)
        }
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
        leaveRequestCell.acceptButton.addTarget(self, action: #selector(handleLeaveRequest), for: .touchUpInside)
        leaveRequestCell.rejectButton.tag = indexPath.row
        leaveRequestCell.rejectButton.addTarget(self, action: #selector(handleLeaveRequest), for: .touchUpInside)
        return leaveRequestCell
    }
    
    @objc func handleLeaveRequest(sender:UIButton){
        if let button = sender.titleLabel?.text{
            let indexPath = IndexPath(row: sender.tag, section: 0)
            let selectedLeave = leaveRequests[indexPath.row]
            let response = leaveDataManager.leaveAction(leaveId: selectedLeave.leaveId, isAccepted: button == "Accept" ? true : false)
            if response {
                leaveRequests.remove(at: indexPath.row)
                table.reloadData()
            }
        }
    }
    
}
