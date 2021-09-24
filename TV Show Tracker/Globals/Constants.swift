//
//  Constants.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import Foundation


enum Constants {
	
	static let applicationId: String = {
		Bundle.main.object(forInfoDictionaryKey: "APPLICATION_ID") as! String
	}()
	
	static let clientKey: String = {
		Bundle.main.object(forInfoDictionaryKey: "CLIENT_KEY") as! String
	}()
	
	static let serverURL = "https://parseapi.back4app.com/"
}
