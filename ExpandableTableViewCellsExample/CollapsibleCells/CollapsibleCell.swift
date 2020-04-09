//
//  CollapsibleTableViewCell.swift
//  Expandable Cells Test
//
//  Created by Josh Angelsberg on 4/8/20.
//  Copyright © 2020 Josh Angelsberg. All rights reserved.
//

import UIKit

protocol CollapsibleCell {
    func updateUI(shouldExpand: Bool)
    
    var animationDuration: Double { get }
    var chevronRotationAngle: CGFloat { get }
}


// Default Implementation
extension CollapsibleCell {
    var animationDuration: Double {
        return 0.3
    }
    
    var chevronRotationAngle: CGFloat {
        return CGFloat(Double.pi/2.0)
    }
}


class CollapsibleBaseCell: UITableViewCell, CollapsibleCell {

    @IBOutlet var chevronImageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateForUserInterfaceStyle()
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        updateForUserInterfaceStyle()
    }
    
    func updateForUserInterfaceStyle() {
        if #available(iOS 12.0, *), traitCollection.userInterfaceStyle == .dark {
            chevronImageView?.tintColor = .white
        } else {
            chevronImageView?.tintColor = .black
        }
    }
    
    func updateUI(shouldExpand: Bool) {
        assert(false, "must override in subclass")
    }
}
