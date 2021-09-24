//
//  TVShowItemTableViewCell.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit

class TVShowItemTableViewCell: UITableViewCell {

	// MARK: Outlets
	
	@IBOutlet weak var outerView: UIView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var seasonsLabel: UILabel!
	@IBOutlet weak var dateIconImageView: UIImageView!
	@IBOutlet weak var releaseDateLabel: UILabel!
	
	// MARK: View Lifecycle Methods
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
		setupViewsAppearance()
    }

    // MARK: Data setup Methods
	
	func setupTVShow(_ tvShow: TVShowListViewModel) {
		nameLabel.text = tvShow.name
		seasonsLabel.text = tvShow.noOfSeasons
		releaseDateLabel.text = tvShow.releaseYear
	}

}

// MARK: - Private Methods

private extension TVShowItemTableViewCell {
	
	func setupViewsAppearance() {
		nameLabel.font = Font.regular(18)
		seasonsLabel.font = Font.regular(12)
		releaseDateLabel.font = Font.regular(12)
		dateIconImageView.tintColor = Color.primaryInverse
		outerView.setCornerRadius(10)
		outerView.backgroundColor = Color.primaryLight
		
		nameLabel.textColor = Color.primaryInverse
		[seasonsLabel, releaseDateLabel].forEach{
			$0?.textColor = Color.primaryInverseLight
		}
	}
	
}

