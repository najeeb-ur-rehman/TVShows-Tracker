//
//  AddNewTVShowPresenter.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import Foundation

enum AddNewTVShowField: String {
	case title = "TVShow title is empty"
	case year = "Please enter valid year of release"
	case seasons = "Please enter valid no. of seasons"
}

protocol AddNewTVShowPresentationLogic {
	func presentErrorForIncorrectDataInField(_ field: AddNewTVShowField)
	func presentError(_ error: TVShowTrackerError)
	func presentTVShowSaveSuccess()
	func presentSavingData(_ saving: Bool)
}

class AddNewTVShowPresenter: AddNewTVShowPresentationLogic {
	
	// MARK: Instance Properties
	
	weak var viewController: AddNewTVShowDisplayLogic?
	
	// MARK: Presenatation Logic
	
	func presentError(_ error: TVShowTrackerError) {
		viewController?.displayAlertWithMessage(error.message, andTitle: "Error")
	}
	
	func presentErrorForIncorrectDataInField(_ field: AddNewTVShowField) {
		viewController?.displayAlertWithMessage(field.rawValue, andTitle: "Error")
	}
	
	func presentTVShowSaveSuccess() {
		viewController?.resetData()
		viewController?.displayAlertWithMessage("TV Show saved successfully!", andTitle: "Success")
	}
	
	func presentSavingData(_ saving: Bool) {
		viewController?.displayLoader(saving)
	}
	
}
