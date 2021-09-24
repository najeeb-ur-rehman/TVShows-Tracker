//
//  TVShowsFetchWorker.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//


import Foundation
import Parse



enum TVShowTrackerError: Error {
	case parseError
	case somethingWentWrong
	case custom(message: String)
	
	var message: String {
		switch self {
		case .custom(let message): return message
		case .somethingWentWrong: return "Something went wrong"
		case .parseError: return "Failed to parse"
		}
	}
}



class TVShowsFetchWorker {
	
	func fetchTVShowsPage(_ pageNo: Int, itemsPerPage: Int, withCompletion completion: @escaping (Result<[TVShow], TVShowTrackerError>) -> Void) {
		let query = PFQuery(className: TVShow.parseClassName())
		query.limit = itemsPerPage
		query.skip = pageNo * itemsPerPage
		query.order(byDescending: "createdAt")
		query.findObjectsInBackground { (objects, error) in
			guard let tvShows = objects as? [TVShow] else {
				let errorMessage = error?.localizedDescription ?? "Failed to fetch TVShows"
				completion(.failure(.custom(message: errorMessage)))
				return
			}
			tvShows.forEach { $0.decodePFObject() }
			completion(.success(tvShows))
		}
	}
}
