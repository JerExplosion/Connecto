//
//  RImageV.swift
//  Connecto
//
//  Created by Jerry Ren on 7/14/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

@IBDesignable class RImageView: UIImageView {
    @IBInspectable var cRadius: CGFloat = 5 {
        didSet {
            self.layer.cornerRadius = cRadius 
        }
    }
}
