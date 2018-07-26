//
//  UserModel.swift
//  MenuPlanner
//
//  Created by Lisa Steele on 7/25/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

class UserModel: NSObject {
    //var userID: Int?
    //var userName: String?
    var fName: String?
    var lName: String?
    //var userTypeID: Int?
    //var hasAllergy: Bool?
    
    override init() {
    }
    
    init(fName: String, lName: String) {
        //self.userID = userID
        //self.userName = userName
        self.fName = fName
        self.lName = lName
        //self.userTypeID = userTypeID
        //self.hasAllergy = hasAllergy
    }
    
    override var description: String {
//        return "UserID: \(String(describing: userID)), UserName: \(String(describing: userName)), FName: \(String(describing: fName)), LName: \(String(describing: lName)), UserTypeID: \(String(describing: userTypeID)), HasAllergy: \(String(describing: hasAllergy))"
    return "FName: \(String(describing: fName)), LName: \(String(describing: lName))"
    }
}
