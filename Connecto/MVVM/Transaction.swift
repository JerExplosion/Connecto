//
//  Transaction.swift
//  Connecto
//
//  Created by Jerry Ren on 6/23/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct Transaction: Codable {
    let name: String
    let email: String
    let type: CType
    let size: CSize
}

enum CSize: String, Codable, CaseIterable {
    case uno
    case dos
    case tres
}
    
enum CType: String, Codable, CaseIterable {
    case college
    case highSchool
}
         
