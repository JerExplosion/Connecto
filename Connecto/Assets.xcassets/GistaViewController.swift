//
//  GistaViewController.swift
//  Connecto
//
//  Created by Jerry Ren on 5/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Firebase

class GistaViewController: UIViewController {
    
    @IBOutlet weak var pasuwodoTextField: UITextField!
    
    @IBOutlet weak var emeruTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = "whatev" // why doesn't this work
    }
    
    @IBAction func signupActivated(_ sender: CurvedButton) {
        
        // change to guard let later
        if let password = pasuwodoTextField.text, let email = emeruTextField.text {

            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let ergo = error {
                    print(ergo.localizedDescription)
                    // do a notification pop-up to tell 'em 'passwords must be 6 digits or longer'
                } else {
                    self.performSegue(withIdentifier: GloballyUsed.registrationSegue, sender: self)
                }
            } 
        }
        
    }
    
}    

