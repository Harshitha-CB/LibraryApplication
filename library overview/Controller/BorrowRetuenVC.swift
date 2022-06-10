//
//  BorrowRetuenVC.swift
//  library overview
//
//  Created by cdp on 12/05/22.
//

import UIKit

class BorrowRetuenVC: UIViewController, UITextFieldDelegate {
    
    //create outlet
    @IBOutlet weak var returnDateL: UILabel!
    @IBOutlet weak var borrowdateL: UILabel!
    @IBOutlet weak var returnDatePicker: UIDatePicker!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var enterbookTxt: UITextField!
    
    var selectDatePicker : Date = Date()
    var returnDateSelected : Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.locale = .current
        datePicker.date = Date()
        returnDatePicker.date = Date()
        datePicker.preferredDatePickerStyle = .compact
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //create actions for buttons and datepicker
    @IBAction func segmenySeleted(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0 :
            datePicker.preferredDatePickerStyle = .compact
            datePicker.isEnabled = true
            returnDatePicker.isEnabled = false
        case 1 :
            datePicker.preferredDatePickerStyle = .compact
            datePicker.isEnabled = false
            returnDatePicker.isEnabled = true
        default :
            break
        }
    }
    
    
    @IBAction func selectDatePicker(_ sender: Any) {
        //borrow date will be selected
        selectDatePicker = datePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        borrowdateL.text = dateFormatter.string(from: selectDatePicker)
        
    }
    
    @IBAction func returnDateSelected(_ sender: Any) {
        //return date will be selected
        returnDateSelected = returnDatePicker.date
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd/MM/yyyy"
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
       
        returnDateL.text = dateFormatter1.string(from: returnDateSelected)
        
    }
    
    @IBAction func borrowClick(_ sender: Any) {
        
        let bookname = enterbookTxt.text ?? ""
        
        addDetails(bookname: bookname, borrowDate: selectDatePicker, returnDate: returnDateSelected)
        print("Added Deatils")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "details") as! BorrowBooksVC
        
        show(vc, sender: nil)
        
    }
    @IBAction func backClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "member")  as! WelcomePageMem
        show(vc, sender: nil)
    }
    
    @IBAction func returnClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "details")  as! BorrowBooksVC
        show(vc, sender: nil)
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
