//
//  newRegisterVC.swift
//  library overview
//
//  Created by cdp on 09/05/22.
//

import UIKit

class newRegisterVC: UIViewController {
    
    //creat outlet for textfields
    @IBOutlet weak var phoneNumTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var newpasswordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var firstNameTxt: UITextField!
    
    
    var isValidCredentials = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Home Dir: \(NSHomeDirectory())")
        // Do any additional setup after loading the view.
        
        firstNameTxt.delegate = self
        lastNameTxt.delegate = self
        phoneNumTxt.delegate = self
        emailTxt.delegate = self
        newpasswordTxt.delegate = self
        confirmPasswordTxt.delegate = self
        
    }
    
    //Action for cancle click button and instantiating to the login screen of library member
    @IBAction func cancleClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "login")
        show(vc!, sender: nil)
    }
    
    //Action for clickhere button and instantiate to the next screen to display users details
    @IBAction func clickhere(_ sender: Any) {
        if isValidCredentials == true
        {
        let vc = storyboard?.instantiateViewController(withIdentifier: "new") as! NewUserDetailsVC
        vc.text = """
           First Name:     \(firstNameTxt.text ?? "") \n
           Last Name:      \(lastNameTxt.text ?? "") \n
           Phone Number: \(phoneNumTxt.text ?? "") \n
           Email ID:       \(emailTxt.text ?? "")
           """     
            
            show(vc, sender: nil)
        
        }
        else
        {
            let alert = UIAlertController(title: nil, message: "Entered invalid data", preferredStyle: .alert)
            show(alert, sender: nil)

            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
        }
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

}

//extension for newRegisterVC class using subclass as UITextFieldDelegate
extension newRegisterVC : UITextFieldDelegate
{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case firstNameTxt :
            lastNameTxt.becomeFirstResponder()
        case lastNameTxt:
            phoneNumTxt.becomeFirstResponder()
        case phoneNumTxt:
            emailTxt.becomeFirstResponder()
        case emailTxt:
            newpasswordTxt.becomeFirstResponder()
        case newpasswordTxt:
            confirmPasswordTxt.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let data = textField.text ?? ""
        
        switch textField {
        case firstNameTxt :
            isValidCredentials = validateFName(fname: data)
        case lastNameTxt :
            isValidCredentials = validateLName(lname: data)
        case phoneNumTxt:
            isValidCredentials = validateMobile(mobile: data)
        case emailTxt:
            isValidCredentials = validateEmail(email: data)
        case newpasswordTxt:
            isValidCredentials = validateNewPassword(newpasswd: data)
        case confirmPasswordTxt :
            isValidCredentials = validateConfirmPasswords(cnfPass: data)
        default:
            break
        }
    }
    
//Below functions are used to validate data of all fields in new register page
    
    //first name
    func validateFName(fname: String) -> Bool{
        if !fname.isEmpty{
            return true
        }
        else {
            return false
        }
    }
    
    //last name
    func validateLName(lname: String) -> Bool
    {
        if !lname.isEmpty{
            return true
        }
        else {
            return false
        }
    }
    
    //mobile number
    func validateMobile(mobile: String) -> Bool{
        return mobile.count == 10 ? true : false
    }
    
    //email ID
    func validateEmail(email: String) -> Bool {
        if !email.isEmpty {
            return true
        }
        
        return false
    }
    
    //new password
    func validateNewPassword(newpasswd: String) -> Bool {
        return newpasswd.count >= 8 ? true : false
        
    }
    
    //confirm password
    func validateConfirmPasswords(cnfPass: String) -> Bool {
        let firstPass = newpasswordTxt.text ?? ""
        
        return cnfPass == firstPass ? true : false
    }
}
