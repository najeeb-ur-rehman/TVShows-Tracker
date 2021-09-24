//
//  TVShowListViewController.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 23/09/2021.
//

import UIKit

protocol TVShowListDisplayLogic: AnyObject {
	func updateTVShowsList(_ viewModels: [TVShowListViewModel])
	func displayLoader(_ show: Bool)
}

class TVShowListViewController: UIViewController {
	
	// MARK: Instance Properties
	
	private var tvShowsList = [TVShowListViewModel]()
	var interactor: TVShowListBusinessLogic?
	

	// MARK: Outlets
	
	@IBOutlet var tvShowListView: TVShowListView!
	
	
	// MARK: ViewController Lifecycle Methods
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.title = "Added TV Shows"
		interactor?.getTVShowsList()
    }

}

// MARK: - Display Logic Methods

extension TVShowListViewController: TVShowListDisplayLogic {
	
	func displayLoader(_ show: Bool) {
		DispatchQueue.main.async {
			if show {
				Loader.show(self.view)
			} else {
				Loader.hide(self.view)
			}
		}
	}
	
	func updateTVShowsList(_ viewModels: [TVShowListViewModel]) {
		tvShowsList.append(contentsOf: viewModels)
		DispatchQueue.main.async {
			self.tvShowListView.tableView.reloadData()
		}
	}
	
}

// MARK: - UITableView Delegate & Datasource Methods

extension TVShowListViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tvShowsList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
				withIdentifier: TVShowItemTableViewCell.reuseIdentifier) as? TVShowItemTableViewCell else {
			return UITableViewCell()
		}
		cell.setupTVShow(tvShowsList[indexPath.row])
		return cell
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let actualPosition = scrollView.contentOffset.y
		let contentHeight = scrollView.contentSize.height - scrollView.frame.size.height
		if contentHeight > 0 && contentHeight - actualPosition <= 20 {
			interactor?.getTVShowsList()
		}
	}
	
}
