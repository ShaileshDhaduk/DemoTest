//
//  LoginViewController.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupViewModel()
    }
    
    
    //MARK:- Function
    func setup() {
        setNabigationTitle(title: "Login")
        lblError.text = ""
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
        
        viewModel.loginSuccessfully = { [weak self] in
            self?.goto_homevc()
        }
    }
    
    //MARK:- Action
    @IBAction func btnLogin_clicked(_ sender: UIButton) {
        lblError.text = ""
        if checkValidation() {
            viewModel.loginApicall(email: txtEmail.text!, pwd: txtPassword.text!)
        }
    }
    
    @IBAction func btnSignup_clicked(_ sender: UIButton) {
        let signupVC = SignupViewController.loadController()
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    //MArk:- Valication check
    
    func checkValidation() -> Bool {
        var isValid = true
        
        if (txtEmail.text!.isEmpty) {
            isValid = false
            lblError.text = "Required Email"
            
        }else if txtEmail.text!.isEmpty {
            isValid = false
            lblError.text = "Required Password"
        }
        return isValid
    }
    
    //MARK:- Redirection
    func goto_homevc() {
        let homeVC = HomeViewController.loadController()
        let navigation = UINavigationController(rootViewController: homeVC)
        self.view.window!.rootViewController = navigation
    }
}
