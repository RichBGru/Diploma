//
//  UIView + Extension.swift
//  Diploma
//
//  Created by Ткачук Артем Сергеевич on 23.03.2022.
//

import Foundation
import UIKit

extension UIView {
    public func addSubviewWithConstraints(_ subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subview]|", options: [], metrics: nil, views: ["subview": subview]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview]|", options: [], metrics: nil, views: ["subview": subview]))
    }
}
