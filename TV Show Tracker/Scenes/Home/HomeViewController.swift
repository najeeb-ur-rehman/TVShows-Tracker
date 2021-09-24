//
//  HomeViewController.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit

class HomeViewController: UIViewController {

	// MARK: Outlets
	
	@IBOutlet var homeView: HomeView!
	
	// MARK: ViewController Lifecycle Methods
	
    override func viewDidLoad() {
        super.viewDidLoad()

		setupNavigationBarAppearance()
    }

	// MARK: Actions
	
	@IBAction
	func addNewTVShowAction(_ sender: UIButton) {
		let addNewTVShowViewController = AddNewTVShowViewBuilder.build()
		navigationController?.pushViewController(addNewTVShowViewController, animated: true)
	}
	
	@IBAction
	func showTVShowsListAction(_ sender: UIButton) {
		let tvShowListViewController = TVShowListViewBuilder.build()
		navigationController?.pushViewController(tvShowListViewController, animated: true)
	}
	
}

// MARK: - Private Methods

private extension HomeViewController {
	
	func setupNavigationBarAppearance() {
		title = "TVShows Tracker"
		navigationController?.navigationBar.tintColor = Color.primaryInverse
		navigationItem.backButtonTitle = " "
	}
	
}
