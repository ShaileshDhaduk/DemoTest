//
//  PropertyViewModel.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import Foundation


class PropertyViewModel {
    
    var propertyList : [AIProperty] = [AIProperty]()
    private var cellViewModel: [PropertyCellModel] = [PropertyCellModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var selectedProperty: PropertyCellModel?
    var selectedIndexpath: IndexPath?
    
    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus:((_ status:Bool)->Void)?
    

    //MARK:- Fetch Property list
    
    func fetchProperty(id: String? = nil) {
//        isLoading = true
        var params = [
            "is_mobile_api" : "1",
//            "userid"        : AIUser.sharedManager.user_id,
//            "role_id"       : AIUser.sharedManager.role_id,
//            "franchisee_id" : AIUser.sharedManager.franchisee_id
        ]
        if let id = id {
            params["account_id"] = id
        }
        
//        ServiceManager.apiPropertyList(parameters: params)  { (isSuccess, message, propertyList) in
////            self.isLoading = false
//            if isSuccess, let propertys = propertyList {
//                self.processFetchedCustomer(allProperty: propertys)
//            }else {
//                print("Fail PropertyList API",message)
////                self.alertMessage = message
//            }
//        }
    }
    
    func processFetchedCustomer(allProperty: [AIProperty]) {
        propertyList = allProperty
        var vms = [PropertyCellModel]()
        
        for property in allProperty {
            vms.append(createCellViewModel(property: property))
        }
        self.cellViewModel = vms
    }
    
    func createCellViewModel(property: AIProperty) -> PropertyCellModel {
        return PropertyCellModel(propertyId: property.id,
                             name: property.franchisee_id,
                             propertyName: property.project_id
//                             address: property.address_line_1,
//                             priceProperty: property.rate_sqft,
//                             updatedDate: property.updated,
//                             source: Source(dict: ["id":property.source_id]),
//                             propType: property.prop_type,
//                             transactionType: property.prop_transaction_type
            
        )
    }
    
    func getCellViewModel(at indexPath:IndexPath) -> PropertyCellModel {
        return self.cellViewModel[indexPath.row]
    }
}


struct PropertyCellModel {
    var propertyId     : String
    var name        : String
    var propertyName : String
}
