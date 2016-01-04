//
//  ViewController.swift
//  changr
//
//  Created by Samuel Overloop on 16/12/15.
//  Copyright © 2015 Samuel Overloop. All rights reserved.
//

// NOTE TO SELF: Do not use appdelegate for firebase operation
// rather have a model that can be mocked 

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    var appDelegate: AppDelegate!
    let firebase = FirebaseWrapper()
    
    // MARK: Outlets
    @IBOutlet weak var currentUserLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        balanceLabel.text = "Your Balance is: £0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: Actions
    @IBAction func menuButton(sender: AnyObject) {
        appDelegate.centerContainer!.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    
    @IBAction func logoutButton(sender: AnyObject) {
        firebase.ref.unauth()
        appDelegate.window?.rootViewController = appDelegate.rootController
        appDelegate.window!.makeKeyAndVisible()
    }

}

