//
//  ChatBubbleCellooU.swift
//  Connecto
//
//  Created by Jerry Ren on 6/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class ChatBubbleCellooU: UITableViewCell {
   
    @IBOutlet weak var chatBubbleViewU: UIView!
    @IBOutlet weak var chatBubbleULabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chatBubbleViewU.layer.cornerRadius = chatBubbleViewU.frame.size.height / 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
    
