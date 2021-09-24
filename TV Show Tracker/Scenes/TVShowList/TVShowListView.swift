//
//  TVShowListView.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import UIKit

class TVShowListView: UIView {

	// MARK: Outlets
	@IBOutlet weak var tableView: UITableView! {
		didSet {
			tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
		}
	}
	
}

