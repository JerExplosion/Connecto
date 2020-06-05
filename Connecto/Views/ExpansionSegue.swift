//
//  ExpansionSegue.swift
//  Connecto
//
//  Created by Jerry Ren on 6/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class ExpansionSegue: UIStoryboardSegue {
    override func perform() {
        expansion()
    }
    
    func expansion() {
        
        let fromVC = self.source
        let toVC = self.destination
         
        let containerView = fromVC.view.superview
        let fromVCCenter = fromVC.view.center
        
        toVC.view.transform = CGAffineTransform(scaleX: 0.03, y: 0.03)
        toVC.view.center = fromVCCenter
        
        containerView?.addSubview(toVC.view)
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
            toVC.view.transform = CGAffineTransform.identity
        }) { (triumph) in
            fromVC.present(toVC, animated: false, completion:  nil)
        }
    }
    
}
