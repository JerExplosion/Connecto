//
//  iMessViewController.swift
//  Connecto
//
//  Created by Jerry Ren on 5/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Firebase
import UIKit

class iMessViewController: UIViewController, UITextFieldDelegate {
        
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
      textField.text!.removeAll()
  //    doneBarButton.isEnabled = false
      return true
    }
    
    @IBOutlet weak var iMessTable: UITableView!
    @IBOutlet weak var iMessTextField: UITextField!
    
    let databaseFire = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iMessTable.dataSource = self
        navigationItem.title = ""
        navigationItem.hidesBackButton = true
        
        iMessTable.register(UINib(nibName: GloballyUsed.chatBubbleNibMi, bundle: nil), forCellReuseIdentifier: GloballyUsed.chatCelloIDMi)
        
        iMessTable.register(UINib(nibName: GloballyUsed.chatBubbleNibU, bundle: nil), forCellReuseIdentifier: GloballyUsed.chatCelloIDU)
        
        fireloadMessages()
    }
    
    func fireloadMessages() {
        databaseFire.collection(GloballyUsed.FireStore.collectionName)
            .order(by: GloballyUsed.FireStore.dateFD)
            .addSnapshotListener { (querySnapshot, error) in
                
                self.iChats = []
                
                if let ergo = error {
                    print(ergo.localizedDescription)
                    
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for docu in snapshotDocuments {
                            let data = docu.data()
                            if let mSender = data[GloballyUsed.FireStore.senderFD] as? String, let mBody = data[GloballyUsed.FireStore.bodyFD] as? String {
                                let iNewMess = iMess(sender:mSender, body: mBody)
                                self.iChats.append(iNewMess)
                                
                                DispatchQueue.main.async {
                                    self.iMessTable.reloadData()
                                    
                                    let particularIndexPath = IndexPath(row: (self.iChats.count - 1), section:  0)
                                    self.iMessTable.scrollToRow(at: particularIndexPath, at: UITableView.ScrollPosition.top, animated: true) // false may be preferrable tho
                                    
                                }
                            }
                        }
                    }
                }
        }
    }
    
    
    var iChats: [iMess] = [
        iMess(sender: "007@007.com", body: "  "),
        iMess(sender: "33233.com", body: " "),
        iMess(sender: "007@007.com", body: "")
    ]
    
    
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
        
        if let messageToBeShot = iMessTextField.text,
            let messageCreator = Auth.auth().currentUser?.email {
            
            if messageToBeShot.isEmpty {
                print("Empty Message") // notification - "say something babe"
                
                alertFormula(title: nil, message: "Message can't be empty bud", action: "Try again")
            
            }
            else {
                
                databaseFire.collection(GloballyUsed.FireStore.collectionName).addDocument(data:
                    
                    [   GloballyUsed.FireStore.senderFD: messageCreator,   GloballyUsed.FireStore.bodyFD: messageToBeShot, GloballyUsed.FireStore.dateFD: Date().timeIntervalSince1970
                    ])
                    
                { (error) in
                    if let ergo = error {
                        print(ergo.localizedDescription + "具体是: \(ergo)")
                    } else {
                        print("successfully saved data")
                        
                        DispatchQueue.main.async {
                            self.iMessTextField.text = ""
                        }
                    }       
                }
            } // the end of else
            
        }
    }
}


