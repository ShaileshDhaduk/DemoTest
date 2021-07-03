//
//  PoolTableViewCell.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import UIKit

class PoolTableViewCell: UITableViewCell {

    @IBOutlet weak var containtView: UIView!
    @IBOutlet weak var tableViewTeam: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    //MARK:- Function
    
    fileprivate func setup() {
        containtView.layer.borderWidth = 1
        containtView.layer.borderColor = UIColor.black.cgColor
        containtView.layer.cornerRadius = 5
        containtView.clipsToBounds = true
        tableViewTeam.registerCell(TeamTableViewCell.self)
        tableViewTeam.delegate = self
        tableViewTeam.dataSource = self
    }
    
    func setupCell(model: PoolCellModel) {
        
    }
}

extension PoolTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamTableViewCell") as! TeamTableViewCell
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.setupCell(no:"\(indexPath.row+1)", name: "MB SURF 14's ")
        return cell
        
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "\(indexPath.row+1)"
//        return cell
    }
    
}
