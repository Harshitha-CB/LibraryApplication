//
//  LoginLibrarianVC.swift
//  library overview
//
//  Created by cdp on 11/05/22.
//

import UIKit

class LoginLibrarianVC: UIViewController {
    
    //outlet for password and librarianID text fields
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var librarianID: UITextField!
    
    var isValidCredentials = false
    
    //user defaults are used to store librarian ID and password
    let uDefaults = UserDefaults()
    
    override func viewWillAppear(_ animated: Bool) {
        passwordTxt.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NSHomeDirectory function is used to check stored librarianID and password using the link displayed in output window
        print("Home dir: \(NSHomeDirectory())")
        
        let oldID = uDefaults.string(forKey: "Librarian ID") ?? ""
        let oldPass = uDefaults.string(forKey: "Password") ?? ""
        
        if oldID.isEmpty || oldPass.isEmpty{
            
        }
        else{
            librarianID.text = oldID
            passwordTxt.text = oldPass
        }
        
        // Do any additional setup after loading the view.
    }
    
    //create action for rememberClick
    @IBAction func remembermeClick(_ sender: Any) {
        
        if isValidCredentials == true
        {
        let ID = librarianID.text ?? ""
        let password = passwordTxt.text ?? ""
        
        if !ID.isEmpty && !password.isEmpty{
            
            uDefaults.set(ID,forKey: "userid")
            uDefaults.set(password,forKey: "password")
            
            
            print("data saved")
            
        }
        else
        {
            print("data not valid")
        }
        }
        
        
    }
    
    //create action for cancleClick button
    @IBAction func cancleClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "welcome")
        show(vc!, sender: nil)
    }
    
    @IBAction func loginClick(_ sender: Any) {
        
        if librarianID.text?.isEmpty == false && librarianID.text?.count ?? 0 >= 4
        {
            if passwordTxt.text?.isEmpty == false && passwordTxt.text?.count ?? 0 >= 8
            {
            let vc = storyboard?.instantiateViewController(withIdentifier: "librarianAct")
            show(vc!, sender: nil)
            }
        }
        else
        {
            print("entered invalid data")
            let alert = UIAlertController(title: nil, message: "Entered invalid data", preferredStyle: .alert)
            show(alert, sender: nil)
            
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            
        }
    }
}



extension LoginLibrarianVC : UITextViewDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == librarianID {
            // its username texfield, get focus to password textfield
            passwordTxt.becomeFirstResponder() // focus on password textfield
        } else {
        // its password texfield, dismiss keyboard
            textField.resignFirstResponder() // dismiss keyboard
        }
        print("Data: \(textField.text ?? "" )")
        
        return true
    }
}








