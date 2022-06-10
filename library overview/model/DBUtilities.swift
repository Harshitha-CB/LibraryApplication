//
//  DBUtilities.swift
//  library overview
//
//  Created by cdp on 12/05/22.
//

import Foundation
import UIKit
import CoreData


//create and fetch managed object 
let mContext = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext

//call addname function and pass parameters
func addname(name: String, cardnum: Int32){
    
    //create object for class Memberslist
    let member = Memberslist(context: mContext)
    
    member.name = name
    member.card_num = cardnum
    
    
    do {
        try mContext.save() //save data
        
        print("Member added..")
    }catch {
        print("Unable to add Member: \(error.localizedDescription)")
        mContext.delete(member)
    }
    
}

//create function getAllMembers to load all data from coredata
func getAllMembers() -> [Memberslist] {
    
    //NSFetchRequest is to retrive data from persistant store
    let fReq : NSFetchRequest<Memberslist> = Memberslist.fetchRequest()
    
    do {
        let membersList = try mContext.fetch(fReq) // select query executed
        return membersList
        
    }catch {
        print("Could not query: \(error.localizedDescription)")
    }
    
    return []
}

func deleteMem(mem: Memberslist){
    // delete
    
    mContext.delete(mem)
    do {
        try mContext.save()
        print("Deleted \(mem.name ?? "" )")
    }catch {
        print("Could not delete \(mem.name ?? "")")
    }
}
