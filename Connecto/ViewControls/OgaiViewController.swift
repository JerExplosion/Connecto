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
                print(ergo.localizedDescription)
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
