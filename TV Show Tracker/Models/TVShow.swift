//
//  TVShow.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import Foundation
import Parse

protocol ParseEncoder {
	func encodePFObject()
}

protocol ParseDecoder {
	func decodePFObject()
}

typealias ParseCodable = ParseEncoder & ParseDecoder


class TVShow: PFObject {
	
	var title: String?
	var year: Int?
	var seasons: Int?
	
	convenience init(title: String?, year: Int?, seasons: Int?) {
		self.init()
		
		self.title = title
		self.year = year
		self.seasons = seasons
	}
	
}

extension TVShow: ParseCodable {
	
	func encodePFObject() {
		self["title"] = title
		self["year"] = year
		self["seasons"] = seasons
	}
	
	
	func decodePFObject() {
		self.title = self["title"] as? String
		self.year = self["year"] as? Int
		self.seasons = self["seasons"] as? Int
	}
	
}

extension TVShow: PFSubclassing {
	
	static func parseClassName() -> String {
		return "TVShow"
	}
	
}



