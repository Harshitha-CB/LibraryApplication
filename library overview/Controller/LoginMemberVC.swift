//
//  LoginMemberVC.swift
//  library overview
//
//  Created by cdp on 11/05/22.
//

import UIKit

class LoginMemberVC: UIViewController {
    
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    
    
    
    var isValidCredentials = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        passwordTxt.delegate = self
        usernameTxt.delegate = self
    }
    
    
    @IBAction func signUpClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "newreg")
        
        show(vc!, sender: nil)
    }
    @IBAction func cancleClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "welcome")
        
        show(vc!, sender: nil)
    }
    @IBAction func loginClick(_ sender: Any) {
        
        if isValidCredentials == true
        {
            print("credentials are valid")
            let vc = storyboard?.instantiateViewController(withIdentifier: "member")
            show(vc!, sender: nil)
        }
        else
        {
            print("credentials are not valid")
            usernameTxt.text = ""
            passwordTxt.text = ""
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
extension LoginMemberVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // editing is complete, validate data
        
        let data = textField.text ?? ""
        
        if textField == usernameTxt
        {
            //validate email
            if (data.contains("@"))
            {
                print("credentials are valid")
                isValidCredentials = true
            }
            else
            {
                print("credentials are not valid")
                isValidCredentials = false
            }
        }
        if textField == passwordTxt
        {
            // validate password
            
            if data.count >= 8
            {
                print("credentials are valid")
                isValidCredentials = true
            }
            else
            {
                print("credentials are not valid")
                isValidCredentials = false
                
            }
        }
        
        print("Done with valid data: \(isValidCredentials)")
    }
    
}
