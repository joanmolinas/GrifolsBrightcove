//
//  BrightcoveReproducerController.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 14/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import UIKit

class BrightcoveReproducerController: UINavigationController {

	// MARK: - Life cycle
	init(account: Account, video: Video) {
		let reproducer = BrightcoveReproducerViewController(account: account, video: video)
		super.init(rootViewController: reproducer)
		navigationBar.isTranslucent = false
		navigationBar.barTintColor = .black
		navigationBar.tintColor = .white
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

