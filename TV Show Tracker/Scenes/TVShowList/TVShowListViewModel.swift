//
//  TVShowListViewModel.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import Foundation

class TVShowListViewModel {
	
	var name: String
	var noOfSeasons: String
	var releaseYear: String
	
	init(_ tvShow: TVShow) {
		self.name = tvShow.title ?? "-"
		self.noOfSeasons = "\(String(tvShow.seasons ?? 0)) seasons"
		self.releaseYear = String(tvShow.year ?? 0)
	}
}
