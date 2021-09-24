//
//  UITableViewCell.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit

extension UITableViewCell {
	
	static var reuseIdentifier: String {
		return String(describing: self)
	}
	
}
