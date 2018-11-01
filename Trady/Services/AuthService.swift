//
//  AuthService.swift
//  Trady
//
//  Created by Sherif Kamal on 11/1/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let result = result else {
                userCreationComplete(false, error)
                return
            }
            let userData = ["provider" : result.user.providerID, "email" : result.user.email]
            DataService.instance.createDBUser(uid: result.user.uid, userData: userData as Dictionary<String, Any>)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
}
