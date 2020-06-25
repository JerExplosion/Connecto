//
//  AttachTransActViewController.swift
//  Connecto
//
//  Created by Jerry Ren on 6/20/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

class AttachTransActViewController: UIViewController {
    
    private var createTransactionViewModelObject = CreateTransactionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV.delegate = self
        tableV.dataSource = self
    }
 
    @IBOutlet weak var tableV: UITableView!

}

extension AttachTransActViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // createTransactionViewModelObject.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cello = tableV.dequeueReusableCell(withIdentifier: GloballyUsed.createTransactionCelloID, for: indexPath)
        
        cello.textLabel?.text = "T-holder" //self.createTransactionViewModelObject.types[indexPath.row]
        
        return cello
    }

}

