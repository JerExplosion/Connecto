//
//  ChatBubbleCelloo.swift
//  Connecto
//
//  Created by Jerry Ren on 5/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class ChatBubbleCelloo: UITableViewCell {

//    @IBOutlet weak var migeeImageView: UIImageView!
//    @IBOutlet weak var hidareeImageView: UIImageView!
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var chatBubbleView: UIView!
     
    override func awakeFromNib() {
        super.awakeFromNib()
        chatBubbleView.layer.cornerRadius
            = chatBubbleView.frame.size.height / 6 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
 
