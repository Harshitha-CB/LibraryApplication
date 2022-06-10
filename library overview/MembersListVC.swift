//
//  MembersListVC.swift
//  library overview
//
//  Created by cdp on 12/05/22.
//

import UIKit

class MembersListVC: UIViewController {
    
    
    //create outlet for tableview
    @IBOutlet weak var memberTableView: UITableView!
    
    var memList : [Memberslist] = []
    override func viewWillAppear(_ animated: Bool) {
        
        memList = getAllMembers()
        memberTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        
        print("Home Dir: \(NSHomeDirectory())")
        
        //to display members list in tableview call getAllMembers function
        memList = getAllMembers()
        
        print("Total Members: \(memList.count)")
        
        memberTableView.dataSource = self
        memberTableView.delegate = self
        
    }
    
    
    //create action for backarrow button when user click on backarrow button it will redirect to its welcome page
    @IBAction func backarrowClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "librarianAct")  as! librarianActivityVC
        show(vc, sender: nil)
    }
    
    //create action for plusClick button, if user wants to issue library card to user
    @IBAction func plusClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "issue")
        
        show(vc!, sender: self)
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

//UITableViewDataSource is added to the MembersListVC class using extension method to get number of rows in section and data in the cell
extension MembersListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // get cell, bind data, return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "memCell", for: indexPath) as! MemberListCell
        
        let mem = memList[indexPath.row]
        
        cell.namesL.text = mem.name
        cell.cardNumberL.text = "\(mem.card_num)"
        
        return cell
    }
    
    
}


//UITableViewDelegate is added to the MembersListVC class using extension method to perform some function when user click on that cell
extension MembersListVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let member = memList[indexPath.row]
        let alertVC = UIAlertController(title: "Delete Member", message: "Do you want to delete \(member.name ?? " ")", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "YES", style: .default) { _ in
            deleteMem(mem: member)
            
            self.memList.remove(at: indexPath.row)
            
            self.memberTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let no = UIAlertAction(title: "NO", style: .default, handler: nil)
        
        alertVC.addAction(yes)
        alertVC.addAction(no)
        present(alertVC, animated: false, completion: nil)
    }
}
