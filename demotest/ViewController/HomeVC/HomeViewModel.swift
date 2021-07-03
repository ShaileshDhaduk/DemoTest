//
//  HomeViewModel.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import Foundation

class HomeViewModel {
    
    var headerTitle = ["POOL A", "POOL B"]
    
    private var cellViewModel: [PoolCellModel] = [PoolCellModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var reloadTableViewClosure: (()->())?
    
    var numberOfCell:Int {
        return cellViewModel.count
    }
    
    func fetchData() {
        var vms = [PoolCellModel]()
        vms.append(createCellViewModel(name: "Rank Team Name"))
        vms.append(createCellViewModel(name: "Rank Team Name"))
        self.cellViewModel = vms
    }
    
    func createCellViewModel(name: String) -> PoolCellModel {
        return PoolCellModel(name: name
        )}
    
    func getHeaderTitle(at section: Int) -> String {
        return self.headerTitle[section]
    }
    
    func getCellViewModel(at indexPath:IndexPath) -> PoolCellModel {
        return self.cellViewModel[indexPath.row]
    }
}

struct PoolCellModel {
    var name    : String
}
