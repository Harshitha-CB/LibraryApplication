//
//  SearchBarLVC.swift
//  library overview
//
//  Created by cdp on 11/05/22.
//

import UIKit

class SearchBarLVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    //Array is used to store books name if you want to search books by its name thes names are displayed in table view
    var data:[String] = ["Swift", "C", "Java","C++", "Python","SQL","Kotlin","Spring","Ruby","Machine Learning","Artificial Intelligence","Data Science","Manual Testing","Automation Testing"]
    
    var filteredData = [String]()
    
    //Create outlet for table view and search bar
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var mySearchText: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        filteredData = data
    }
    
    //UITableViewDataSource protocols 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    //UISearchBarDelegate protocols
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""
        {
            filteredData = data.filter{ $0.contains(searchText)}
            myTable.reloadData()
        }
        else
        {
            print("kindly enter search text first")
            filteredData = data
            myTable.reloadData()
            
        }
    }
    //create action for backClick button
    @IBAction func backClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "button")  as! HomePageButtonsVC
        show(vc, sender: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false
    }
}
