//
//  librarianActivityVC.swift
//  library overview
//
//  Created by cdp on 10/05/22.
//

import UIKit

class librarianActivityVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func membersListClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "memList")  as! MembersListVC
        show(vc, sender: nil)
        
    }
    @IBAction func issueLibraryCardClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "issue")
        
        show(vc!, sender: nil)
    }
    @IBAction func searchBooksClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "search")
        
        show(vc!, sender: nil)
    }
    
    @IBAction func homePageClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "welcome")  as! ViewController
        show(vc, sender: nil)
    }
    @IBAction func deleteClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "addbook")  as! BookListVC
        show(vc, sender: nil)
    }
    @IBAction func addClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "author")  as! AddBookVC
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
