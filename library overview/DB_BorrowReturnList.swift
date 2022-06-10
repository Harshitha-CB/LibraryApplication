//
//  DB_BorrowReturnList.swift
//  library overview
//
//  Created by cdp on 14/05/22.
//

import Foundation
import UIKit
import CoreData

let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext

//call function addDetails and pass parameters
func addDetails(bookname:String, borrowDate: Date, returnDate: Date)
{
    //create object for class Borrow_Return
    let borrowReturn = Borrow_Return(context: context)
    
    borrowReturn.bookname = bookname
    borrowReturn.borrowDate = borrowDate
    borrowReturn.returnDate = returnDate
    
    do {
        try context.save() //save data
        
        print("Books added..")
    }catch {
        print("Unable to add Member: \(error.localizedDescription)")
        context.delete(borrowReturn)
    }
}

//create function getAllDetails to load all data from coredata
func getAllDetails() -> [Borrow_Return] {
    
    //NSFetchRequest is to retrive data from persistant store
    let fetchReq : NSFetchRequest<Borrow_Return> = Borrow_Return.fetchRequest()
    
    do {
        let borrowList = try context.fetch(fetchReq) // select query executed
        return borrowList
        
    }catch {
        print("Could not query: \(error.localizedDescription)")
    }
    
    return []
}

func deleteDetails(details: Borrow_Return){
    // delete
    
    context.delete(details)
    do {
        try context.save()
        print("Deleted \(details.bookname ?? "" )")
    }catch {
        print("Could not delete \(details.bookname ?? "")")
    }
}



