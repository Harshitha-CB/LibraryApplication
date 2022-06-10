//
//  ViewController.swift
//  library overview
//
//  Created by cdp on 09/05/22.
//

import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func librarymemberClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "login")
        show(vc!, sender: nil)
        
    }
    @IBAction func librarianClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "librarian")
        show(vc!, sender: nil)
    }
    
    
}

