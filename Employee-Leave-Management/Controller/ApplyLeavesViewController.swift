//
//  ApplyLeavesViewController.swift
//  Employee-Leave-Management
//
//  Created by Yashwitha on 10/08/22.
//

import UIKit

class ApplyLeavesViewController: UIViewController ,UITextViewDelegate{
    let DatePickerPressed = false
    @IBOutlet weak var FromDate: UITextField!
    @IBOutlet weak var ToDate: UITextField!
    @IBOutlet weak var Reason: UITextField!
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        
    }
    func createDatePicker(){
        // create Toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        // create done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolBar.setItems([doneButton], animated: true)
        
        //assign toolbar
        FromDate.inputAccessoryView   = toolBar
        ToDate.inputAccessoryView     = toolBar
        
        //assign datepicker to the text field
        FromDate.inputView    = datePicker
        ToDate.inputView      = datePicker
        
        //datepicker mode
        datePicker.datePickerMode = .date
    }
    @IBAction func SubmitButtonPressed(_ sender: UIButton) {
        let fromDate = FromDate.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let toDate = ToDate.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let reason = Reason.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if let currentEmployee = currentEmployee{
            if((fromDate != "") && (toDate != "")  && (reason != "")){
                leaveDataManager.leaveRequests(fromDate: fromDate!, toDate: toDate!, reason: reason!, requestorID: currentEmployee.employeeId, managerID: currentEmployee.managerID,status: LeaveStatus.applied.rawValue, requestorName: currentEmployee.fullName)
                dismiss(animated: true, completion: nil)
        }
       
        }
        }
        
    
        
    
    
    @IBAction func BackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func doneButtonTapped() {
        let dateFormatter = DateFormatter()
        if FromDate.isFirstResponder {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            FromDate.text = dateFormatter.string(from: datePicker.date)
        }
        if ToDate.isFirstResponder {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            ToDate.text = dateFormatter.string(from: datePicker.date)
        }
        
        self.view.endEditing(true)
    }
    
    @IBAction func LogoutButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let HomePageViewController = storyBoard.instantiateViewController(withIdentifier: "MainPage")
        HomePageViewController.modalPresentationStyle = .fullScreen
        self.present(HomePageViewController, animated:true, completion:nil)
    }
}
