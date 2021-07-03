//
//  LoginViewModel.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import Foundation

class LoginViewModel {
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var loginSuccessfully:(()->())?
    var showAlertClosure: (()->())?
    
    //MARK:- Login api
    func loginApicall(email:String, pwd:String) {
        
        FirebaseManager.loginUser(email: email, pwd: pwd) { (isSuccess, message) in
            if isSuccess {
                self.loginSuccessfully?()
            }else {
                self.alertMessage = message
            }
        }
    }
    
}
