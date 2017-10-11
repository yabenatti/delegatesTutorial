//
//  VJChatBubbleImageView.swift
//  VistaChatSwift
//
//  Created by Yasmin Benatti on 14/07/17.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

class VJChatBubbleImageView: UIImageView {

    func constraintImageOnView(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setSpecialInsetImage(name: "outgoingBubble")
        self.tintColor = ColorUtils.Colors.LightPink
        view.insertSubview(self, at: 0)
        
        let bubbleTopConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let bubbleLeadingConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let bubbleTrailingConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let bubbleBottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        view.addConstraints([bubbleTopConstraint, bubbleLeadingConstraint, bubbleTrailingConstraint, bubbleBottomConstraint])
    }
    
    func setSpecialInsetImage(name: String) {
        self.image = UIImage(named: name)?.resizableImage(withCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)).withRenderingMode(.alwaysTemplate)
    }

}
