//
//  AddBookVC.swift
//  library overview
//
//  Created by cdp on 12/05/22.
//

import UIKit

class AddBookVC: UIViewController {
    //create outlet for text fields, datepicker, labels
    @IBOutlet weak var publicationL: UILabel!
    @IBOutlet weak var publicationDatePicker: UIDatePicker!
    @IBOutlet weak var authorTxt: UITextField!
    @IBOutlet weak var bookNameTxt: UITextField!
    
    var selectedDate : Date = Date()
    var isValidCredentials = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        bookNameTxt.delegate = self
        authorTxt.delegate = self
        
        
        print("Home Dir: \(NSHomeDirectory())")
    }
    //create actions for date picker, add and back buttons
    @IBAction func selectDate(_ sender: Any) {
        selectedDate = publicationDatePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        publicationL.text = formatter.string(from: selectedDate)
    }
    
    
    @IBAction func backClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "librarianAct")  as! librarianActivityVC
        show(vc, sender: nil)
    }
    
    @IBAction func addClick(_ sender: Any) {
        
        if isValidCredentials == true
        {
            let bookname = bookNameTxt.text ?? ""
            let author = authorTxt.text ?? ""
            
            
            addbook(name: bookname, author: author, publication: selectedDate)
            print("Added Books")
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "addbook")
            
            show(vc!, sender: nil)
        }
        else
        {
            //alert to display message if user entered invalid data
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



extension AddBookVC : UITextFieldDelegate
{
    // textfield calls this method whenever user taps the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let data = textField.text ?? ""
        //validate bookname and author name
        switch textField {
        case bookNameTxt :
            isValidCredentials = validateName(name: data)
        case authorTxt:
            isValidCredentials = validateauthor(author: data)
        default:
            break
        }
    }
    
    
    //functions for validating author name and book name
    
    func validateauthor(author: String) -> Bool
    {
        if !author.isEmpty {
            return true
        }
        else
        {
            return false
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
