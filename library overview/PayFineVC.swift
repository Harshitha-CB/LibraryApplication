//
//  PayFineVC.swift
//  library overview
//
//  Created by cdp on 15/05/22.
//

import UIKit

class PayFineVC: UIViewController {

   //create outlets for text fields
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var amountTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //create actions for buttons
    @IBAction func backarrowClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "member")  as! WelcomePageMem
        show(vc, sender: nil)
    }
    @IBAction func clickhere(_ sender: Any) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "fine") as! FineDetailsVC
        vc.text = "\(nameTxt.text ?? "") pay \(amountTxt.text ?? "") Rs fine"
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true, completion: nil)
       // show(vc!, sender: nil)
          
        }
    
    
    
   
    
    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    */

}

