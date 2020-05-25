//
//  iMessViewController.swift
//  Connecto
//
//  Created by Jerry Ren on 5/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Firebase
import UIKit

class iMessViewController: UIViewController {
    
    @IBOutlet weak var iMessTable: UITableView!
    
    @IBOutlet weak var iMessTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "⚡️"
        navigationItem.hidesBackButton = true
        
    }
    
    
    @IBAction func signOutTapped(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
         
            navigationController?.crossDissolvePopToRoot(self)
          
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    
    @IBAction func shootTapped(_ sender: UIButton) {
        
        
    }
    
    
    
}
