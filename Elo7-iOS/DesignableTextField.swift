//
//  DesignableTextField.swift
//  Elo7-iOS
//
//  Created by lugia on 19/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class DesignableUITextField: UITextField {

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }

    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var rightPadding: CGFloat = 0

    func updateView() {
        if let image = rightImage {
            rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            rightView = imageView
        } else {
            rightViewMode = UITextFieldViewMode.never
            rightView = nil
        }
    }
}
