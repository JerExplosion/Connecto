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
        self.segmentsGenerated()
    }
    
    var customizedSegmentedControl: UISegmentedControl!
 
    @IBOutlet weak var tableV: UITableView!
    
    func segmentsGenerated() {
        customizedSegmentedControl = UISegmentedControl(items: self.createTransactionViewModelObject.sizes)
        
        customizedSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.customizedSegmentedControl)
        
        customizedSegmentedControl.topAnchor.constraint(equalTo: self.tableV.bottomAnchor, constant: 20).isActive = true
        
        customizedSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableV.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableV.cellForRow(at: indexPath)?.accessoryType = .detailDisclosureButton
    }

}

