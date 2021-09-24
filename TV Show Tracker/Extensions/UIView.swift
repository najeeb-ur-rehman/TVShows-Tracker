//
//  UIView.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit

extension UIView {
	
	func setCornerRadius(_ r : CGFloat, andClipContent clip: Bool = false) {
		layer.cornerRadius = r
		layer.masksToBounds = clip
	}
	
	func setBorderColor(_ color: UIColor?, withWidth width: CGFloat = 1.0){
		layer.borderColor = color?.cgColor
		layer.borderWidth = width
	}
}
