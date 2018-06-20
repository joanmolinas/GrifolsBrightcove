//
//  BrightcoveReproducerViewController.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 14/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import UIKit
import BrightcovePlayerSDK

public class BrightcoveReproducerViewController: UIViewController, BCOVPlaybackControllerDelegate {

	// MARK: - Public properties
	public private(set) var account: Account!
	public private(set) var video: Video!
	
	// MARK: - Private properties
	private let fairPlayAuthProxy = BCOVFPSBrightcoveAuthProxy.sharedInstance
	private let sdkManager = BCOVPlayerSDKManager.shared()
	private var playbackController: BCOVPlaybackController!
	private lazy var playbackService: BCOVPlaybackService = {
		return BCOVPlaybackService(accountId: account.account, policyKey: account.policyKey)
	}()
	
	
	// MARK: - Life cycle
	init(account: Account, video: Video) {
		super.init(nibName: nil, bundle: nil)
		self.account = account
		self.video = video
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	deinit {
		print("Deinit " + String(describing: self))
	}
	
	override public func viewDidLoad() {
		super.viewDidLoad()
//		setupPlaybackController()
//		setupPlayerView()
		requestContentFromPlaybackService()
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "close", style: .done, target: self, action: #selector(dismiss(_:)))
	}
	
	override public func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		playbackController.pause()
	}
	
	func requestContentFromPlaybackService() {
		playbackService.findVideo(withVideoID: video.id, parameters: nil) { (video: BCOVVideo?, jsonResponse: [AnyHashable: Any]?, error: Error?) -> Void in
			
			if let v = video {
				print(video)
//				let arr = NSArray(array: [v])
//				self.playbackController!.setVideos(arr)
			} else {
				print("ViewController Debug - Error retrieving video: \(error?.localizedDescription ?? "unknown error")")
			}
		}
	}
	
	public func playbackController(_ controller: BCOVPlaybackController!, didAdvanceTo session: BCOVPlaybackSession!) {
		print("Advanced to new session")
	}
	
	public func playbackController(_ controller: BCOVPlaybackController!, playbackSession session: BCOVPlaybackSession!, didProgressTo progress: TimeInterval) {
		print("Progress: \(progress) seconds")
	}
}

private extension BrightcoveReproducerViewController {
	@objc func dismiss(_ sender: UIBarButtonItem) {
		navigationController?.dismiss(animated: true, completion: nil)
	}
	
	func setupPlaybackController() {
		playbackController = sdkManager?.createPlaybackController()
		playbackController.isAutoAdvance = false
		playbackController.isAutoPlay = true
		playbackController.delegate = self
		playbackController.view.frame = view.bounds
		playbackController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		view.addSubview(playbackController.view)
	}
	
	func setupPlayerView() {
		let controls = BCOVPUIBasicControlView.withVODLayout()
		let playerView = BCOVPUIPlayerView(
			playbackController: playbackController,
			options: nil,
			controlsView: controls)
		
		playerView?.frame = view.bounds
		playerView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		view.addSubview(playerView!)
		
		playerView?.playbackController = playbackController
	}
}

