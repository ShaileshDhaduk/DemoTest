//
//  BaseViewController.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // SET TITLE
    func setNabigationTitle(title: String) {
        self.navigationItem.title = title
    }
    
    func setLogoutButton() {
        let btnLogout = UIButton(frame: CGRect(x: 10, y: 0, width: 40, height: 44))
        btnLogout.setTitle("LOGOUT", for: .normal)
        btnLogout.setTitleColor(UIColor.black, for: .normal)
        btnLogout.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(15), weight: UIFont.Weight.regular)
        btnLogout.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        let barButton  = UIBarButtonItem(customView: btnLogout)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    // DISPLAY NAVIGATION
    
    func showNavigation() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.view.backgroundColor = .clear
    }
    
    // HIDE NAVIDATION
    
    func hideNavigation() {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(self.backAction(sender:)))
    }
    
    // DISABLE BACK ACTION
    
    @objc func backAction(sender: AnyObject) {
        //Your Code
    }
    
    @objc func logoutAction(sender: AnyObject) {
        let loginVC = LoginViewController.loadController()
        let navigation = UINavigationController(rootViewController: loginVC)
        self.view.window!.rootViewController = navigation
    }
}
