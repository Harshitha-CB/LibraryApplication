//
//  DBUtilitiesBook.swift
//  library overview
//
//  Created by cdp on 12/05/22.
//

import Foundation
import UIKit
import CoreData

let Context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext

//call addbook function and pass parameters
func addbook(name:String, author: String, publication: Date)
{
    //create object for the class Books
    let book = Books(context: mContext)
    
    book.bookname = name
    book.author = author
    book.publication_date = publication
    do {
        try mContext.save() //save data
        
        print("Books added..")
    }catch {
        print("Unable to add Member: \(error.localizedDescription)")
        Context.delete(book)
    }
}

//create function getAllBooks to load all data from coredata
func getAllBooks() -> [Books] {
    
    //NSFetchRequest is to retrive data from persistant store
    let fReq : NSFetchRequest<Books> = Books.fetchRequest()
    
    do {
        let booksList = try mContext.fetch(fReq) // select query executed
        return booksList
        
    }catch {
        print("Could not query: \(error.localizedDescription)")
    }
    
    return []
}

func deleteBooks(book: Books){
    // delete
    
    Context.delete(book)
    do {
        try Context.save()
        print("Deleted \(book.bookname ?? "" )")
    }catch {
        print("Could not delete \(book.bookname ?? "")")
    }
}

