//
//  TVShowListPresenter.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import Foundation

protocol TVShowListPresentationLogic {
	func presentUpdatedTVShows(_ tvShows: [TVShow])
	func presentDataFetching(_ fetching: Bool)
}

class TVShowListPresenter: TVShowListPresentationLogic {
	
	
	// MARK: Instance Properties
	
	weak var viewController: TVShowListDisplayLogic?
	
	// MARK: Presentation Logic
	
	func presentUpdatedTVShows(_ tvShows: [TVShow]) {
		let tvShowViewModels = tvShows.map(TVShowListViewModel.init)
		viewController?.updateTVShowsList(tvShowViewModels)
	}
	
	func presentDataFetching(_ fetching: Bool) {
		viewController?.displayLoader(fetching)
	}
	
}
