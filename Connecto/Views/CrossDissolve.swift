//
//  CrossDissolve.swift
//  Connecto
//
//  Created by Jerry Ren on 5/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

extension UINavigationController {
    func crossDissolve(_ viewController: UIViewController) {
        
        let cdTransition = CATransition()
        cdTransition.duration = 0.47
        cdTransition.type = CATransitionType.fade
        view.layer.add(cdTransition, forKey: nil)
        pushViewController(viewController, animated: false)
        
    }
}

extension UINavigationController {
    func crossDissolvePopToRoot(_ viewController: UIViewController) {
        
        let cdTransition = CATransition()
        cdTransition.duration = 0.61
        cdTransition.type = CATransitionType.fade
        view.layer.add(cdTransition, forKey: nil)
        popToRootViewController(animated: false)
        
    }
}
                  

//let allControllers = self.navigationController?.viewControllers
// for desiredVC in allControllers! {
//   if desiredVC is KaoViewController {
//     _ = self.navigationController?.popToViewController(desiredVC as! KaoViewController, animated: true)
//   }
//}

// MARK: - set viewcontrollers

// extension UINavigationController {
//
//    func crossDissolveSetViewControllers(_ vcArray: [UIViewController]) {
//
//        let cdTransition = CATransition()
//        cdTransition.duration = 0.47
//        cdTransition.type = CATransitionType.fade // reveal
//        view.layer.add(cdTransition, forKey: nil)
//        navigationController?.setViewControllers(vcArray, animated: false)
//    }
//
//}
