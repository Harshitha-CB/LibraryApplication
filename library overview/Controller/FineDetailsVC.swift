//
//  FineDetailsVC.swift
//  library overview
//
//  Created by cdp on 15/05/22.
//

import UIKit

class FineDetailsVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    var text : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if text != nil {
            label.text = text
        }

        // Do any additional setup after loading the view.
    }
    //create action for payclick and give alert message as paid succesfully when user pay fine
    @IBAction func payClick(_ sender: Any) {
        
        let alert = UIAlertController(title: "Pay Fine", message: "Paid Succesfully", preferredStyle: .alert)
        show(alert, sender: nil)
        
        let action = UIAlertAction(title: "OK", style: .default) {_ in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "pay") as! PayFineVC
            self.show(vc, sender: nil)
        }
        alert.addAction(action)
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
