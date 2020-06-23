//
//  TransactionTBViewController.swift
//  Connecto
//
//  Created by Jerry Ren on 6/22/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation

class TransactionTBViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateTransactions()
    }
    
    private func populateTransactions() {
        
        guard let transactionURL = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders")
            else {
                print("Url ain't correct")
                return
        }
        
        let resource = Resourcefulness<[Transaction]>(url: transactionURL)
        print(resource)
        
        InterWebService().loader(resource: resource) { (result) in
            print(result)
            switch result {
            case .success(let transaction):
                print(transaction)
            case .failure(let error):
                print(error)
            }
        }
    }
}


