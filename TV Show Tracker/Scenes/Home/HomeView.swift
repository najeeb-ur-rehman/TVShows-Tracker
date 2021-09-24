//
//  HomeView.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit

class HomeView: UIView {

	// MARK: Outlets
	
	@IBOutlet weak var bannerImageView: UIImageView!
	@IBOutlet weak var addNewButton: UIButton!
	@IBOutlet weak var showListButton: UIButton!

	// MARK: View Lifecycle Methods
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupViewsAppearance()
	}
}

// MARK: - Private Methods

private extension HomeView {
	
	func setupViewsAppearance() {
		backgroundColor = Color.primary
		bannerImageView.setCornerRadius(5, andClipContent: true)
		[addNewButton, showListButton].forEach {
			$0?.setTitleColor(Color.primary, for: .normal)
			$0?.titleLabel?.font = Font.medium(18)
			$0?.backgroundColor = Color.secondary
			$0?.setCornerRadius(25)
		}
	}
}
