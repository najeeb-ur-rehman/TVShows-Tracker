//
//  TVShowListInteractor.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import Foundation

protocol TVShowListBusinessLogic {
	func getTVShowsList()
}

class TVShowListInteractor {
	
	// MARK: Instance Properties
	
	private var pageNo = 0
	private var allDataFetched = false
	private let itemsPerPage: Int
	private var fetchingData = false
	private var tvShowsFetchWorker: TVShowsFetchWorker
	var presenter: TVShowListPresentationLogic?
	
	// MARK: Initializer
	
	init(_ worker: TVShowsFetchWorker, itemsPerPage: Int) {
		self.tvShowsFetchWorker = worker
		self.itemsPerPage = itemsPerPage
	}
	
	// MARK: Helper Methods
	
	func isNextPageAvailable() -> Bool {
		return !allDataFetched
	}

	func isFetching() -> Bool {
		return fetchingData
	}
}

// MARK: Business Logic

extension TVShowListInteractor: TVShowListBusinessLogic {
	
	func getTVShowsList() {
		guard !isFetching(), isNextPageAvailable() else {
			return
		}
		fetchingData = true
		presenter?.presentDataFetching(true)
		tvShowsFetchWorker.fetchTVShowsPage(pageNo, itemsPerPage: itemsPerPage) { [weak self] result in
			guard let self = self else {
				return
			}
			self.presenter?.presentDataFetching(false)
			switch result {
			case .success(let shows):
				self.allDataFetched = shows.count < self.itemsPerPage
				self.pageNo += 1
				self.presenter?.presentUpdatedTVShows(shows)
			case .failure(let error):
				print(error.localizedDescription)
			}
			self.fetchingData = false
		}
	}
	
}
