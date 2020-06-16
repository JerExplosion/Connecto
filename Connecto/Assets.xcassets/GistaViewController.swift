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
    }
    
    @IBAction func switchToSignIn(_ sender: UIButton) {
        let primaryStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let destination = primaryStoryboard.instantiateViewController(withIdentifier: GloballyUsed.OgaiStoryboardID) as? OgaiViewController else {
            print("destination unclear bud")
            return
        }
        navigationController?.crossDissolve(destination)
        
        guard var vcArray = navigationController?.viewControllers else { return }
        let count = vcArray.count
        
        vcArray.remove(at: (count - 2))
        navigationController?.setViewControllers(vcArray, animated: false)
    }
    
    @IBAction func signupActivated(_ sender: CurvedButton) {
        
        // change to guard let later
        if let password = pasuwodoTextField.text, let email = emeruTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let ergo = error {
                    print(ergo.localizedDescription)
                    // do a notification pop-up to tell 'em 'passwords must be 6 digits or longer'
                    
                    let errorMessage = ergo.localizedDescription
                    
                    if errorMessage == GloballyUsed.badEmailRegistryError {
                        self.alertFormula(title: <#T##String?#>, message: <#T##String?#>, action: <#T##String?#>)
                    }
                    
                    else if errorMessage == GloballyUsed.emptyEmailRegistryError {
                        self.alertFormula(title: <#T##String?#>, message: <#T##String?#>, action: <#T##String?#>)
                    }
                    
                    else if errorMessage == GloballyUsed.passwordRegistryError {
                        self.mustBeLongerThanSixCharsAlert()
                    }
                    
                } else {
                    self.performSegue(withIdentifier: GloballyUsed.registrationSegue, sender: self)
                }
            } 
        }
    }
    
}                 

extension GistaViewController {
    
    func mustBeLongerThanSixCharsAlert() {
        let alertCon = UIAlertController(title: nil, message: "Bruh, passwords must be 6 characters or longer", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
        alertCon.addAction(dismissAction)
        present(alertCon, animated: true, completion: nil)
    }
    
}

// MARK: - Implement these two tomorrow

// (might be a bit of an logic puzzle, since the passwords alert condition also needs to be altered)

// "The email address is badly formatted."
//  "An email address must be provided."



