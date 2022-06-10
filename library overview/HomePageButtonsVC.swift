//
//  HomePageButtonsVC.swift
//  library overview
//
//  Created by cdp on 17/05/22.
//

import UIKit

class HomePageButtonsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //create actions for buttons 
    @IBAction func librarymemberClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "member")  as! WelcomePageMem
        show(vc, sender: nil)
    }
    @IBAction func librarianClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "librarianAct")  as! librarianActivityVC
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
