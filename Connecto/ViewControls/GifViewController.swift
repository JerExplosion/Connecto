//
//  GifViewController.swift
//  Connecto
//
//  Created by Jerry Ren on 6/11/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class GifViewController: UIViewController {
    
    @IBOutlet weak var profilerImageV: UIImageView!
    
    override func viewDidLoad() {
        profilerImageV.layer.cornerRadius = profilerImageV.frame.size.height / 2
        pikachuLoadsGIF()
    }         
      
    private func pikachuLoadsGIF() {
        let pikachuGIF = UIImage.gifImageWithName(GloballyUsed.pikachuImageName)
        profilerImageV.image = pikachuGIF
    }
}

