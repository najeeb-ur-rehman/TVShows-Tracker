//
//  TVShowListViewBuilder.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import UIKit

class TVShowListViewBuilder {
	
	static func build() -> TVShowListViewController {
		let viewCtrl = UIViewController.instantiate(TVShowListViewController.self,
													fromStoryboard: .Main)
		let worker = TVShowsFetchWorker()
		let interactor = TVShowListInteractor(worker, itemsPerPage: 20)
		let presenter = TVShowListPresenter()
		viewCtrl.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewCtrl
		return viewCtrl
	}
}
