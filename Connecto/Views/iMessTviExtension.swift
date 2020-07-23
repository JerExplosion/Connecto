//
//  iMessTviExtension.swift
//  Connecto
//
//  Created by Jerry Ren on 6/9/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//     

import Firebase
import UIKit

extension iMessViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iChats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var ultimateCello: UITableViewCell
        
        let celloMi = iMessTable.dequeueReusableCell(withIdentifier: GloballyUsed.chatCelloIDMi, for: indexPath) as! ChatBubbleCelloo
        
        let celloU = iMessTable.dequeueReusableCell(withIdentifier: GloballyUsed.chatCelloIDU, for: indexPath) as! ChatBubbleCellooU
        
        celloMi.isUserInteractionEnabled = false
        celloU.isUserInteractionEnabled = false
        
        let dangeeMess = iChats[indexPath.row]
        celloMi.bubbleLabel.text = dangeeMess.body
        celloU.chatBubbleULabel.text = dangeeMess.body
        
        if dangeeMess.sender == Auth.auth().currentUser?.email {
            ultimateCello = celloMi
            celloMi.chatBubbleView.backgroundColor = generateColorWithRGB(red: 232, green: 250, blue: 255, alpha: 1)
                // UIColor(named: "BrandLightBlue")
            celloMi.bubbleLabel.textColor = UIColor.black
            
        } else {
            ultimateCello = celloU
            celloU.chatBubbleULabel.textColor = UIColor.white
        }
        return ultimateCello
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  iMessTable.deselectRow(at: indexPath, animated: true)
        // iMessTable.isUserInteractionEnabled = false
    }
}
  

// Hex code: 147efb

// UIColor(hue: 0.8944, saturation: 0.13, brightness: 0.95, alpha: 1.0)
// go to UIcolor swift code website
