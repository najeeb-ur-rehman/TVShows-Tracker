//
//  Utils.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import UIKit

class Utils {
	
	static func showOkAlert(title: String = "", message: String,
							viewController: UIViewController, completion: (() -> Void)? = nil) {
		let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
			completion?()
		})
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertController.addAction(okAction)
		viewController.present(alertController, animated: true, completion: nil)
	}
	
}
