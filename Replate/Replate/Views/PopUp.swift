//
//  PopUp.swift
//  Replate
//
//  Created by Fabiola S on 8/27/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation
import UIKit

class PopUp: UIView {
    override func awakeFromNib() {
        layer.shadowPath = CGPath(rect: layer.bounds, transform:  nil)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 5)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 8
        
        layer.cornerRadius = 8
    }
}
