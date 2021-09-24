//
//  TVShowsSaveWorker.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import Foundation

class TVShowsSaveWorker {
	
	func saveTVShow(_ tvShow: TVShow, withCompletion completion: @escaping (Result<Bool, TVShowTrackerError>) -> Void) {
		tvShow.encodePFObject()
		tvShow.saveInBackground { status, error in
			guard status else {
				let errorMessage = error?.localizedDescription ?? "Failed to save TVShow on server"
				completion(.failure(.custom(message: errorMessage)))
				return
			}
			completion(.success(true))
		}
	}
}
