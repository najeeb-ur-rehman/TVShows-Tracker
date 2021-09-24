//
//  UIViewController.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit

extension UIViewController {
	
	static var storyboardId: String {
		return String(describing: self)
	}
	
	static func instantiate<ViewController: UIViewController>(_ viewControllerType: ViewController.Type,
															  fromStoryboard storyboardName: UIStoryboard.Name) -> ViewController {
		let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
		return storyboard.instantiateViewController(withIdentifier: viewControllerType.storyboardId) as! ViewController
	}
	
}
