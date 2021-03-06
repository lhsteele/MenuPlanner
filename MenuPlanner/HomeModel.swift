//
//  HomeModel.swift
//  MenuPlanner
//
//  Created by Lisa Steele on 7/25/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class HomeModel: NSObject, URLSessionDataDelegate {
    weak var delegate: HomeModelProtocol!
    
    var data = Data()
    
    let urlPath: String = "http://ec2-13-59-87-126.us-east-2.compute.amazonaws.com/JSONTest.php"
    /*
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) {
            (data, response, error)  in
            guard error == nil else {
                print (error!)
                return
            }
            guard let responseData = data else {
                print ("Error: did not receive data")
                return
            }
            guard let jsonData = String(data: responseData, encoding: String.Encoding.utf8) else {
                print ("error")
                return
            }
            print (data)
            
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
                print (jsonResult)
            } catch {
                print (error)
            }
        }
        task.resume()
    }
    */
   
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) {
            (data, response, error)  in
            if error != nil {
                print ("Failed to download data")
            } else {
                print ("Data downloaded")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) {
        var jsonResult = NSArray()

        do {
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            //print (jsonResult)
        } catch let error as NSError {
            print (error)
        }
        
        var jsonElement = NSDictionary()
        let users = NSMutableArray()
        
        for i in 0..<jsonResult.count {
            jsonElement = jsonResult[i] as! NSDictionary
            //print (jsonElement)
            let user = UserModel()
            
            if //let userID = jsonElement["UserID"] as? Int,
                //let userName = jsonElement["UserName"] as? String,
                let fName = jsonElement["FirstName"] as? String,
                let lName = jsonElement["LastName"] as? String
                //let userTypeID = jsonElement["UserTypeID"] as? Int,
                //let hasAllergy = jsonElement["HasAllergy"] as? Bool
            {
                //user.userID = userID
                //user.userName = userName
                user.fName = fName
                user.lName = lName
                //user.userTypeID = userTypeID
                //user.hasAllergy = hasAllergy
                //print (userID)
                //print (fName)
                //print (lName)
            }
            users.add(user)
            print (users)
        }
        
        
        DispatchQueue.main.async(execute: { () -> Void in
            self.delegate.itemsDownloaded(items: users)
        })
    }
    
}
