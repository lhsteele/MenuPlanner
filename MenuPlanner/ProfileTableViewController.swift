//
//  ProfileViewController.swift
//  MenuPlanner
//
//  Created by Lisa Steele on 7/9/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

class ProfileTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {
   
    
    @IBOutlet weak var userTableView: UITableView!
    var feedItems: NSArray = NSArray()
    var selectedUser : UserModel = UserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.userTableView.delegate = self
        self.userTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        //homeModel.downloadItems()
    }
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        self.userTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: UserModel = feedItems[indexPath.row] as! UserModel
        
        if indexPath.row == 0 {
            let fNameCellIdentifier: String = "FirstNameCell"
            let fNameCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: fNameCellIdentifier)!
            fNameCell.textLabel!.text = item.fName
            return fNameCell
        } else {
            let lNameCellIdentifier: String = "LastNameCell"
            let lNameCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: lNameCellIdentifier)!
            lNameCell.textLabel!.text = item.lName
            return lNameCell
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
