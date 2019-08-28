//
//  Extensions.swift
//  Replate
//
//  Created by Fabiola S on 8/23/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func addLeftPadding(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension Date {
    // instance function
    func dateString() -> String {
        let date = self
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        let today = formatter.string(from: date)
        return today
    }
}
