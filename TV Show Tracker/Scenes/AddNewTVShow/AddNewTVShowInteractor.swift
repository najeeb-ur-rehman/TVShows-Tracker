//
//  AddNewTVShowInteractor.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import Foundation

protocol AddNewTVShowBusinessLogic {
	func saveData(title: String?, year: String?, seasons: String?)
}

class AddNewTVShowInteractor {
	
	// MARK: Instance Properties
	
	private var tvShowSaveWorker: TVShowsSaveWorker
	var presenter: AddNewTVShowPresentationLogic?
	
	// MARK: Initializers
	
	init(_ worker: TVShowsSaveWorker) {
		self.tvShowSaveWorker = worker
	}
	
	// MARK: Helper Methods
	
	func validData(title: String?, year: String?, seasons: String?) -> TVShow? {
		guard let tvShowTitle = title?.trim(), tvShowTitle.isNotEmpty else {
			presenter?.presentErrorForIncorrectDataInField(.title)
			return nil
		}
		guard let seasons = seasons, let noOfSeasons = Int(seasons) else {
			presenter?.presentErrorForIncorrectDataInField(.seasons)
			return nil
		}
		guard let year = year, let releaseYear = Int(year) else {
			presenter?.presentErrorForIncorrectDataInField(.year)
			return nil
		}
		let tvShow = TVShow(title: title, year: releaseYear, seasons: noOfSeasons)
		return tvShow
	}
	
	func saveTVShow(_ tvShow: TVShow) {
		presenter?.presentSavingData(true)
		tvShowSaveWorker.saveTVShow(tvShow) { [weak self] result in
			guard let self = self else {
				return
			}
			self.presenter?.presentSavingData(false)
			switch result {
			case .success:
				self.presenter?.presentTVShowSaveSuccess()
			case .failure(let error):
				self.presenter?.presentError(error)
			}
		}
	}
	
}

// MARK: - Business Logic

extension AddNewTVShowInteractor: AddNewTVShowBusinessLogic {
	
	func saveData(title: String?, year: String?, seasons: String?) {
		guard let tvShow = validData(title: title, year: year, seasons: seasons) else {
			return
		}
		saveTVShow(tvShow)
	}
}
