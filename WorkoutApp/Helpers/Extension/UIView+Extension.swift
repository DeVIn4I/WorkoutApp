//
//  UIView+Extension.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

extension UIView {
    func addBottomBorder(with color: UIColor, and height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separator)
    }
}
