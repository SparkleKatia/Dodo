//
//  InsetLabel.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 18/05/2025.
//


import UIKit

class InsetLabel: UILabel {
    
    var contentInset: UIEdgeInsets = .zero {
        didSet {
            // TODO: Why do we need these two methods? If I comment them, nothing changes.
            // it invalidates cashed intrinsic size and tells layout to resize the laybel in the next layout cycle? Example, badge of the cart count - 1, 10, 100.
            // TODO: What is layout cycle?
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    // TODO: Why do we need to override drawText? (it just moves the text in the center?)
    
//    override func drawText(in rect: CGRect) {
//        super.drawText(in: rect.inset(by: contentInset))
//    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height += contentInset.top + contentInset.bottom
        size.width += contentInset.left + contentInset.right
        return size
    }
}
