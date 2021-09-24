//
//  AddNewTVShowViewController.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit
import Parse

protocol AddNewTVShowDisplayLogic: AnyObject {
	func displayAlertWithMessage(_ message: String, andTitle title: String)
	func resetData()
	func displayLoader(_ show: Bool)
}

class AddNewTVShowViewController: UIViewController {

	// MARK: Instance Properties
	var interactor: AddNewTVShowBusinessLogic?
	
	// MARK: Outlets
	@IBOutlet var addNewTVShowView: AddNewTVShowView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Add New TV Show"
	}
	
	// MARK: Actions
	
	@IBAction
	func saveButtonAction(_ sender: UIButton) {
		let title = addNewTVShowView.title
		let year = addNewTVShowView.releaseYear
		let seasons = addNewTVShowView.seasonsCount
		interactor?.saveData(title: title, year: year, seasons: seasons)
		
	}

}

// MARK: - Display Logic

extension AddNewTVShowViewController: AddNewTVShowDisplayLogic {
	
	func displayAlertWithMessage(_ message: String, andTitle title: String) {
		DispatchQueue.main.async {
			Utils.showOkAlert(title: title, message: message, viewController: self)
		}
	}
	
	func resetData() {
		DispatchQueue.main.async {
			self.addNewTVShowView.clearFieldsData()
			self.addNewTVShowView.titleTextField.becomeFirstResponder()
		}
	}
	
	func displayLoader(_ show: Bool) {
		DispatchQueue.main.async {
			if show {
				Loader.show(self.view)
			} else {
				Loader.hide(self.view)
			}
		}
	}
	
}
