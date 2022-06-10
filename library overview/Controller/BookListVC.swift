//
//  BookListVC.swift
//  library overview
//
//  Created by cdp on 12/05/22.
//

import UIKit

class BookListVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var bookList : [Books] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        bookList = getAllBooks()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Home Dir: \(NSHomeDirectory())")
        
        
        bookList = getAllBooks()
        
        print("Total Books Added: \(bookList.count)")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func backarrowClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "librarianAct")  as! librarianActivityVC
        show(vc, sender: nil)
    }
    
    @IBAction func plusClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "author")
        
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


//UITableViewDataSource is added to the MembersListVC class using extension method to get number of rows in section and data in the cell
extension BookListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! BookListCell
        
        let book = bookList[indexPath.row]
        
        cell.bookNameL.text = book.bookname
        cell.authorNameL.text = book.author
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        cell.publicationDateL.text = formatter.string(from:book.publication_date ?? Date())
        return cell
        
        
    }
    
    
}

//UITableViewDelegate is added to the MembersListVC class using extension method to perform some function when user click on that cell
extension BookListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let books = bookList[indexPath.row]
        let alertVC = UIAlertController(title: "Delete Book", message: "Do you want to delete \(books.bookname ?? " ")", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "YES", style: .default) { _ in
            deleteBooks(book: books)
            
            self.bookList.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let no = UIAlertAction(title: "NO", style: .default, handler: nil)
        
        alertVC.addAction(yes)
        alertVC.addAction(no)
        present(alertVC, animated: false, completion: nil)
    }
    
}
