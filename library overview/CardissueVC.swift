//
//  CardissueVC.swift
//  library overview
//
//  Created by cdp on 10/05/22.
//

import UIKit

class CardissueVC: UIViewController {
    
    @IBOutlet weak var cardNumberT: UITextField!
    @IBOutlet weak var usernameT: UITextField!
    
    var isValidCredentials = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        usernameT.delegate = self
        cardNumberT.delegate = self
        
        print("Home Dir: \(NSHomeDirectory())")
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func cancleClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "librarianAct")
        show(vc!, sender: nil)
    }
    @IBAction func issuecardClick(_ sender: Any) {
        if isValidCredentials == true
        {
            let memName = usernameT.text ?? ""
            let cardnum = cardNumberT.text ?? ""
            let convertedCardNum =  Int32(cardnum) ?? 0
            
            addname(name: memName,cardnum: convertedCardNum)
            print("Added Employee")
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "memList")
            
            show(vc!, sender: nil)
        }
        else
        {
            let alert = UIAlertController(title: nil, message: "Entered invalid data", preferredStyle: .alert)
            show(alert, sender: nil)
            
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            
        }
    }
    
}

extension CardissueVC : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let data = textField.text ?? ""
        switch textField {
        case usernameT :
            isValidCredentials = validateName(name: data)
        
        default:
            break
        }
    }
    
    func validateName(name: String) -> Bool
    {
        if !name.isEmpty{
            return true
        }
        else {
            return false
        }
    }
}
