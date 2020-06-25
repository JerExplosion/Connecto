//
//  VMCreateTransaction.swift
//  Connecto
//
//  Created by Jerry Ren on 6/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
     
struct CreateTransactionViewModel {
    
    var name: String?
    var mail: String?
    
    var types: [String] {
        return CType.allCases.map({ $0.rawValue.capitalized })
    }
    
    var sizes: [String] {
        return CSize.allCases.map { $0.rawValue.capitalized }
    }
    
} 
