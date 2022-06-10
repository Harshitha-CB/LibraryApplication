//
//  WelcomePageMem.swift
//  library overview
//
//  Created by cdp on 12/05/22.
//

import UIKit

class WelcomePageMem: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //create action for pay fine button
    @IBAction func borrowReturnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "borrow")
        
        show(vc!, sender: nil)
    }
    
    //create action for search book button
    @IBAction func searchBookClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "search")
        
        show(vc!, sender: nil)
    }
    
    //create action for home page button
    @IBAction func homepageClick(_ sender: Any) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "welcome") as! ViewController
            
            show(vc, sender: nil)
    }
    
    //create action for pay fine button
    @IBAction func payFineClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "pay")
        
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
