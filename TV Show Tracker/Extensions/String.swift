//
//  String.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import Foundation

extension String {
	
	var isNotEmpty: Bool {
		return !isEmpty
	}
	
	func trim() -> String {
		return self.trimmingCharacters(in: .whitespacesAndNewlines)
	}
	
}
