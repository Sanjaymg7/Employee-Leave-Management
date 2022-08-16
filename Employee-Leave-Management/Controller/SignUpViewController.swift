//
//  SignUpViewController.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 10/08/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var fullNameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var profilePictureImage: UIImageView!
    @IBOutlet weak var isManager: UISwitch!
    
    var imagePicker = UIImagePickerController()
    var profileImage:UIImage?
    
    @IBAction func BackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadProfilePictureClicked(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        let fullName = fullNameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let managerBoolean = isManager.isOn
        if let image = profileImage{
            if((fullName != "") && (email != "") && (password != "")){
                let employee = employeeDataManager.createEmployee(fullName: fullName!, email: email!, password: password!, profilePicture: image, isManager: managerBoolean)
                if let createdEmployee = employee{
                    currentEmployee = createdEmployee
                    performSegue(withIdentifier: "HomePage", sender: self)
                }
            }
        }
    }
    
}

extension SignUpViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profilePictureImage.contentMode = .scaleAspectFill
            profilePictureImage.image = pickedImage
            profileImage = pickedImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
