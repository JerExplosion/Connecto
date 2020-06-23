//
//  Transaction.swift
//  Connecto
//
//  Created by Jerry Ren on 6/23/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct Transaction: Codable {
    let userName: String
    let email: String
    let type: Types
    let size: Sizes
}

enum Sizes: String, Codable {
    case uno
    case dos
    case tres
}
    
enum Types: String, Codable {
    case college
    case highSchool
}
         
