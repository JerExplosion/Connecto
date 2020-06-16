//
//  OgaiViewController.swift
//  Connecto
//
//  Created by Jerry Ren on 5/23/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Firebase
import UIKit

class OgaiViewController: UIViewController {
    
    @IBOutlet weak var pasuwodoTextField: UITextField!
    @IBOutlet weak var emeruTextField: UITextField!
    
    override func viewDidLoad() { }
    
    @IBAction func SigninActivated(_ sender: CurvedButton) {
        
        if let password = pasuwodoTextField.text, let email = emeruTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return } // is this safety measure necessary tho?
                
                if let ergo = error {
                    
                    //     print()
                    if ergo.localizedDescription ==  GloballyUsed.emailSignInError {
                        
                        self.alertFormula(title: nil, message: "Cannot find this Email address", action: "Try again")
                           
                    } else if ergo.localizedDescription == GloballyUsed.passwordSignInError
                    {
                        self.alertFormula(title: nil, message: "Oops. Wrong password", action: "Try again")
                    }
                } else {
                    self.performSegue(withIdentifier: GloballyUsed.signinginSegue, sender: self)
                }
            }
            
        }
        
    }
    
    @IBAction func switchToSignUp(_ sender: UIButton) {
        
        let primaryStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let destination = primaryStoryboard.instantiateViewController(withIdentifier: GloballyUsed.GistaStoryboardID) as? GistaViewController else {
            print("destination unclear bud")
            return
        }
        
        navigationController?.crossDissolve(destination)
        
        guard var vcArray = navigationController?.viewControllers else { return }
        let count = vcArray.count
        
        vcArray.remove(at: (count - 2))
        navigationController?.setViewControllers(vcArray, animated: false)
        
    }
    
}

//extension OgaiViewController {
//    
//    func alertFormula(title: String?, message: String?, action: String?) {
//        let alertCon = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let dismissAction = UIAlertAction(title: action, style: .cancel, handler: nil)
//        alertCon.addAction(dismissAction)
//        present(alertCon, animated: true, completion: nil)
//    }
//}

