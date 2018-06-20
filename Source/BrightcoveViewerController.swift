//
//  BrightcoveViewerController.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 20/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import UIKit
import AVKit

class BrightcoveViewerController: UIViewController {
	
	// MARK: - IBProperties
	@IBOutlet private weak var headerImageView: UIImageView!
	@IBOutlet private weak var viewerView: UIView!
	
	// MARK: - Properties
	var headerImage: UIImage? = nil {
		didSet {
			headerImageView.image = headerImage
		}
	}
	var backgroundColor: UIColor = .white {
		didSet {
			view.backgroundColor = backgroundColor
		}
	}
	
	// MARK: - Life cycle
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
		let player = AVPlayer(url: videoURL!)
		let playerViewController = AVPlayerViewController()
		playerViewController.showsPlaybackControls = true
		playerViewController.player = player
		playerViewController.view.frame = viewerView.bounds
		
		addChildViewController(playerViewController)
		viewerView.addSubview(playerViewController.view)
		playerViewController.didMove(toParentViewController: self)
		playerViewController.player?.play()
	}
}
