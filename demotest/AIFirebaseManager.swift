//
//  AIFirebaseManager.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import Foundation
import Firebase

let FirebaseManager = AIFireBaseManager.shared


class AIFireBaseManager: NSObject {
    
    // MARK: - SHARED MANAGER
    static let shared = AIFireBaseManager()
    
    var db: Firestore!
    var refUser: CollectionReference? = nil
    
    override init() {
        super.init()
        db = Firestore.firestore()
        refUser = db.collection("users")
    }
    
    //MARK:- Login User
    func loginUser(email: String, pwd: String, completion : @escaping ( _ isSuccess:Bool,  _ message:String) -> Void)  {
        print("Login with :",email)
        
        let docRef = db.collection("users").document(email)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                let data = document.data()
                
                if let password = data?["password"] as? String, password == pwd {
                    completion(true, "success")
                }else {
                    completion(false, "Login fail")
                }
            } else {
                print("Document does not exist")
                completion(false, "Invalid data")
            }
        }
    }
    
    //MARK:- Add User
    func addUser(name: String, email: String, pwd: String,  completion : @escaping ( _ isSuccess:Bool,  _ message:String) -> Void) {
        
        var dict = [String:Any]()
        dict["name"]        = name
        dict["email"]       = email
        dict["password"]    = pwd
        
        print("Add user dict : ",dict)
        
        refUser?.document(email).setData(dict, completion: { (err) in
            if let err = err {
                //print("Error updating document: \(err.localizedDescription)")
                completion(false, "Error updating document:  \(err.localizedDescription)")
            } else {
                //print("Document successfully updated.")
                completion(true, "Success")
            }
        })
        
    }
    
    
}
