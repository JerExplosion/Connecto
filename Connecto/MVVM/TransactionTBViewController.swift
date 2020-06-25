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
    
    var transactiveArrayViewModelObject = TransactionsArrayViewModel()
    // weak or not
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
        
        InterWebService().loader(resource: resource) { [weak self]  (result) in
            print(result)
            print(resource)
            switch result {
            case .success(let transactions):
                
                self?.transactiveArrayViewModelObject.transactionsPluralViewModel = transactions.map(TransactiveViewModel.init)
                self?.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactiveArrayViewModelObject.transactionsPluralViewModel.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transactiveVM = transactiveArrayViewModelObject.transactionViewModel(at: indexPath.row)
        
        let cello = tableView.dequeueReusableCell(withIdentifier: GloballyUsed.transactiveCelloID, for: indexPath)
        cello.textLabel?.text = transactiveVM.type  // "Txt"
        cello.detailTextLabel?.text = transactiveVM.email
    //    "Dtxtdt"
        
        return cello
    }
}


