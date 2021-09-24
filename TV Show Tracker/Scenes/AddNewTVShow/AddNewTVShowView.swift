//
//  AddNewTVShowView.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit

class AddNewTVShowView: UIView {
	
	// MARK: Outlets
	
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var releaseYearTextField: UITextField!
	@IBOutlet weak var seasonsCountTextField: UITextField!
	@IBOutlet weak var saveButton: UIButton!
	
	// MARK: Instance Properties
	
	var title: String? {
		titleTextField.text
	}
	var releaseYear: String? {
		releaseYearTextField.text
	}
	var seasonsCount: String? {
		seasonsCountTextField.text
	}
	
	// MARK: View Lifecycle Methods
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupViewsAppearance()
	}
	
	// MARK: Helper Methods
	
	func clearFieldsData() {
		[titleTextField, releaseYearTextField, seasonsCountTextField].forEach { $0?.text = "" }
	}
}

// MARK: - Private Methods

private extension AddNewTVShowView {
	
	func setupViewsAppearance() {
		[titleTextField, releaseYearTextField, seasonsCountTextField].forEach {
			$0?.setCornerRadius(10)
			$0?.backgroundColor = Color.primaryLight
			$0?.textColor = Color.primaryInverse
			$0?.font = Font.regular(16)
		}
		saveButton.backgroundColor = Color.secondary
		saveButton.titleLabel?.font = Font.medium(18)
		saveButton.setTitleColor(Color.primary, for: .normal)
		saveButton.setCornerRadius(25)
	}
}
