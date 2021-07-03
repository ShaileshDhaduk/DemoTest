//
//  SignupViewModel.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import Foundation

class SignupViewModel {
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var signupSuccessfully:(()->())?
    var showAlertClosure: (()->())?
    
    func signupApiCall(name: String, email: String, pwd: String) {
        FirebaseManager.addUser(name: name, email: email, pwd: pwd) { (isSucces, message) in
            if isSucces {
                self.signupSuccessfully?()
            }else {
                self.alertMessage = message
            }
        }
    }
}
