//
//  NewUserDetailsVC.swift
//  library overview
//
//  Created by cdp on 15/05/22.
//

import UIKit

class NewUserDetailsVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var text : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if text != nil {
            label.text = text
        

        // Do any additional setup after loading the view.
    }
    }
    
    @IBAction func submitClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "login")
        show(vc!, sender: nil)
    }
    
    @IBAction func editClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "newreg") 
        show(vc!, sender: nil)
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
