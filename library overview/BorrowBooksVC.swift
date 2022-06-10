//
//  BorrowBooksVC.swift
//  library overview
//
//  Created by cdp on 14/05/22.
//

import UIKit

class BorrowBooksVC: UIViewController {
    
    //create outlet for tableview
    @IBOutlet weak var tableView: UITableView!
    
    var borrowList : [Borrow_Return] = []
    
    override func viewWillAppear(_ animated: Bool) {
        
        borrowList = getAllDetails()
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        print("Home Dir: \(NSHomeDirectory())")
        
        
        borrowList = getAllDetails()
        
        print("Total Members: \(borrowList.count)")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //create action for button
    @IBAction func backClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "borrow")
        
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

extension BorrowBooksVC: UITableViewDataSource {
    
    //returns the number of cells in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return borrowList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! BorrowBookCell
        
        let borrow = borrowList[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        cell.borrowDateL.text = formatter.string(from: borrow.borrowDate ?? Date())
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        cell.returnDateL.text = formatter.string(from: borrow.returnDate ?? Date())
        cell.bookName.text = borrow.bookname
        
        return cell
    }
    
    
}

//Using UITableViewDelegate perform Return and renewal actions by giving alert action
extension BorrowBooksVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let details = borrowList[indexPath.row]
        let alertVC = UIAlertController(title: nil, message: "Do you want to return or renewal \(details.bookname ?? " ") book ", preferredStyle: .alert)
        
        let returnbook = UIAlertAction(title: "Return", style: .default) { _ in
             deleteDetails(details: details)
            self.borrowList.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let renew = UIAlertAction(title: "Renewal", style: .default) { _ in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "borrow")
            self.show(vc!, sender: nil)
            
            
        }
        
        alertVC.addAction(returnbook)
        alertVC.addAction(renew)
        
        
        present(alertVC, animated: false, completion: nil)
        
    }
    
    
}
