//
//  SignupViewController.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import UIKit

class SignupViewController: BaseViewController {

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    var viewModel = SignupViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupViewModel()
    }
   
    //MARK:- Function
    func setup() {
        setNabigationTitle(title: "Sign UP")
        lblError.text = ""
        txtFullName.autocorrectionType = .no
        txtEmail.autocorrectionType = .no
    }

    func setupViewModel() {
        
        viewModel.showAlertClosure = { [weak self] in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.lblError.text = message
                }
            }
        }
        
        viewModel.signupSuccessfully = { [weak self] in
            self?.goto_login()
        }
    }
    
    //MARK:- Action
    
    @IBAction func btnSignup_clicked(_ sender: UIButton) {
        lblError.text = ""
        if checkValidation() {
            viewModel.signupApiCall(name: txtFullName.text!, email: txtEmail.text!, pwd: txtPassword.text!)
        }
        
    }
    
    func checkValidation() -> Bool {
        var isValid = true
        if txtFullName.text!.isEmpty {
            isValid = false
            lblError.text = "Required Full Name"
            
        }else if txtEmail.text!.isEmpty {
            isValid = false
            lblError.text = "Required Email"
            
        }else if txtEmail.text!.isEmpty {
            isValid = false
            lblError.text = "Required Password"
        }
        return isValid
    }
    
    //MARK:- Redirection
    func goto_login() {
        self.navigationController?.popViewController(animated: true)
    }
}
