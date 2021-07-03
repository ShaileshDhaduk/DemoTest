//
//  AIProperty.swift
//  demotest
//


import Foundation


import UIKit

class AIProperty: NSObject {

   var id                 = ""
   var franchisee_id      = ""
   var project_id         = ""
    
    override init() {
        super.init()
    }
    
    init(dict : NSDictionary ) {
        id               = dict.object_forKeyWithValidationForClass_String(aKey: "id")
        franchisee_id    = dict.object_forKeyWithValidationForClass_String(aKey: "franchisee_id")
        project_id       = dict.object_forKeyWithValidationForClass_String(aKey: "project_id")
    }
}
