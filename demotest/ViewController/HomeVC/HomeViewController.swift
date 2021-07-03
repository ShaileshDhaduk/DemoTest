//
//  HomeViewController.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableViewRank: UITableView!
   
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupViewModel()
    }
    
    func setup() {
        setNabigationTitle(title: "Rank Data")
        setLogoutButton()
        tableViewRank.registerCell(PoolTableViewCell.self)
    }
    
    func setupViewModel() {

        viewModel.reloadTableViewClosure = { [weak self] in
            self?.tableViewRank.reloadData()
        }
        viewModel.fetchData()
    }

    //MARK:- Redirection
    func goto_loginVC() {
        let loginVC = LoginViewController.loadController()
        let navigation = UINavigationController(rootViewController: loginVC)
        self.view.window!.rootViewController = navigation
    }
}

//MARk:- Tableview Datasource

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PoolTableViewCell") as! PoolTableViewCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.setupCell(model: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.getHeaderTitle(at: section)
    }
    
}
