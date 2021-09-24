//
//  AppDelegate.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit
import Parse


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		
		let parseConfig = ParseClientConfiguration {
			$0.applicationId = Constants.applicationId
			$0.clientKey = Constants.clientKey
			$0.server = Constants.serverURL
		}
		Parse.initialize(with: parseConfig)
		
		return true
	}


}

