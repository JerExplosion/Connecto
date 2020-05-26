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
    
    let databaseFire = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iMessTable.dataSource = self
        navigationItem.title = "⚡️"
        navigationItem.hidesBackButton = true
        
        iMessTable.register(UINib(nibName: GloballyUsed.chatBubbleNib , bundle: nil), forCellReuseIdentifier: GloballyUsed.chatCelloID)
        
    }
    
    var iChats: [iMess] = [
        iMess(sender: "007@007.com", body: "Hola at ya"),
        iMess(sender: "33233.com", body: "Right back at ya"),
        iMess(sender: "007@007.com", body: "Egao ga suteki dane ")
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
            
            databaseFire.collection(GloballyUsed.FireStore.collectionName).addDocument(data: [ GloballyUsed.FireStore.senderFD: messageCreator, GloballyUsed.FireStore.bodyFD: messageToBeShot]) { (error) in
                if let ergo = error {
                    print(ergo.localizedDescription )
                } else {
                    print("successfully saved data")
                }
            }
        }
    }

}

extension iMessViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iChats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cello = iMessTable.dequeueReusableCell(withIdentifier: GloballyUsed.chatCelloID, for: indexPath) as! ChatBubbleCelloo
       
        cello.bubbleLabel.text = iChats[indexPath.row].body
        
        return cello
    }
    
    
    
    
}
