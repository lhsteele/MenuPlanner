//
//  WelcomeViewController.swift
//  MenuPlanner
//
//  Created by Lisa Steele on 7/9/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginSegue", sender: self.goButton)
    }
    


}
