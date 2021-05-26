//
//  FirebaseService.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 20/05/2021.
//

import Foundation
import FirebaseDatabase

let DB_BASE = Database.database().reference()

class FirebaseService {
    
    static let instance = FirebaseService()
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE : DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS : DatabaseReference {
        return _REF_USERS
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>){
        _REF_USERS.child(uid).updateChildValues(userData)
    }
    
    
    
}
