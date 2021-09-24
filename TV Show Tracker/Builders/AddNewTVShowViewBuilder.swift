//
//  AddNewTVShowViewBuilder.swift
//  TV Show Tracker
//
//  Created by Najeeb VenD on 24/09/2021.
//

import UIKit

class AddNewTVShowViewBuilder {
	
	static func build() -> AddNewTVShowViewController {
		let viewCtrl = UIViewController.instantiate(AddNewTVShowViewController.self,
													fromStoryboard: .Main)
		let worker = TVShowsSaveWorker()
		let interactor = AddNewTVShowInteractor(worker)
		let presenter = AddNewTVShowPresenter()
		viewCtrl.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewCtrl
		return viewCtrl
	}
}
