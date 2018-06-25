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
	private var video: Video!
	private var retriever: BrightcoveVideoRetrievable!
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
	init(video: Video, retriever: BrightcoveVideoRetrievable = BrightcoveVideoUserDefaultsRetriever()) {
		super.init(nibName: nil, bundle: nil)
		self.video = video
		self.retriever = retriever
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		let url = retriever.retrieve(video: video)
		precondition(url != nil, "Trying to reproduce a not downloaded video")
		
		let player = AVPlayer(url: url!)
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
