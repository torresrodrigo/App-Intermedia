//
//  FirebaseAuthService.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 20/05/2021.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService {
    
    static let instance = FirebaseAuthService()
    
    func loginUser(withEmail email: String, andPassword password: String, taskComplete: @escaping (_ status: Bool, _ error: Error?) ->()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
        guard let authResult = authResult else {
            taskComplete(false, error)
            return
        }
        taskComplete(true,nil)
        }
    }
    
    func registerUser(withEmail email: String, andPassword password: String, taskComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
        guard let authResult = authResult else {
            taskComplete(false, error)
            return
        }
        
        let userData = ["provider": authResult.user.providerID, "email": authResult.user.email]
        FirebaseService.instance.createDBUser(uid: authResult.user.uid, userData: userData)
        taskComplete(true, nil)
        }
    }
    
}
