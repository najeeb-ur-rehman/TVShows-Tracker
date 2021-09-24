//
//  Loader.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import Foundation
import MBProgressHUD

class Loader {
	
	public static func show(_ view: UIView, message: String? = nil) {
		var viewFound = false
		repeat {
		   viewFound = MBProgressHUD.hide(for: view, animated: true)
		} while (viewFound)
		
		let loader = MBProgressHUD.showAdded(to: view, animated: true)
		loader.mode = .indeterminate
		loader.bezelView.blurEffectStyle = UITraitCollection.current.userInterfaceStyle == .light ? .dark : .light
		if let message = message {
			loader.label.text = message
		}
		loader.contentColor = Color.primary
	}
	
	public static func hide(_ view: UIView) {
		MBProgressHUD.hide(for: view, animated: true)
		
	}
	
}
