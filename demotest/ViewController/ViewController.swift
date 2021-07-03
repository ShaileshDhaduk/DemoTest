//
//  ViewController.swift
//  demotest
//
//  Created by Atologist Mac 3 on 02/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = PropertyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViewModel()
    }


    //MARK:- Function
    func setup() {
        self.navigationItem.title = "Demo"
        //self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "offer select"), style: .plain, target: self, action: #selector(btnHomePress))
    }
    
    @objc func btnHomePress() {
        print("home press")
    }
    
    func setupViewModel() {

        viewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
//        viewModel.updateLoadingStatus = { [weak self] (isLoading) in
//            DispatchQueue.main.async {
//                if isLoading {
//                    self?.showActivityIndicator(withText: "")
//                }else {
//                    self?.hideActivityIndicator()
//                }
//            }
//        }
        
//        viewModel.showAlertClosure = { [weak self] in
//            DispatchQueue.main.async {
//                if let message = self?.viewModel.alertMessage {
//                    notificationAlert(title: message)
//                }
//            }
//        }
        
//        viewModel.fetchProperty()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row) Row"
        return cell
    }
    
    
}
