//
//  ......    ViewController.swift
//  Connecto
//
//  Created by Jerry Ren on 5/21/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class KaoViewController: UIViewController {
    @IBOutlet weak var centeredLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        self.navigationItem.backBarButtonItem?.title = "Home"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        centeredLabel.text = ""
        let fullDisplay = "Flashy⚡️Connecto"
        var unitCount = 0
        
        for textUnit in fullDisplay {
            Timer.scheduledTimer(withTimeInterval: Double(unitCount) * 0.1, repeats: false) { (timer) in
                self.centeredLabel.text?.append(textUnit)
            }
            unitCount += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}


