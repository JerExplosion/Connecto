//
//  VMTransactive.swift
//  Connecto
//
//  Created by Jerry Ren on 6/23/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

class TransactionsArrayViewModel {
    
    var transactionsPluralViewModel: [TransactiveViewModel]
    
    init() {
        self.transactionsPluralViewModel = [TransactiveViewModel]()
    }
    
    func transactionViewModel(at index: Int) -> TransactiveViewModel {
        return self.transactionsPluralViewModel[index]
    }
}

struct TransactiveViewModel {
    let transaction: Transaction
}

extension TransactiveViewModel {
    
    var userName: String {
        return self.transaction.userName
    }
    var email: String {
        return self.transaction.email
    }
    var sizes: String {
        return self.transaction.size.rawValue.capitalized
    }
    var types: String {
        return self.transaction.type.rawValue
    }
}


