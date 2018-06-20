//
//  BrigthcoveVideoDownloader.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 20/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import Foundation
import BrightcovePlayerSDK
import Alamofire

class BrigthcoveVideoDownloader {
	
	// MARK: - Properties
	let video: Video
	let account: Account
	private lazy var playbackService: BCOVPlaybackService = {
		return BCOVPlaybackService(accountId: account.account, policyKey: account.policyKey)
	}()
	
	// MARK: - Life cycle
	init(account: Account, video: Video) {
		self.account = account
		self.video = video
	}
	
	// MARK: - API
	func download(completion: @escaping () -> Void) {
		playbackService.findVideo(
			withVideoID: video.id,
			parameters: nil)
		{ (video: BCOVVideo?, jsonResponse:  [AnyHashable: Any]?, error: Error?) -> Void in
			
			if let v = video {
				self._download(v, completion: completion)
				//				let arr = NSArray(array: [v])
				//				self.playbackController!.setVideos(arr)
			} else {
				print("BrigthcoveVideoDownloader error downloading video: " + error!.localizedDescription)
			}
		}
	}
	
	private func _download(_ video: BCOVVideo, completion: () -> Void) {
		let source = video.sources.first! as! BCOVSource
//		let url = source.url!
		let url = URL(string: "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4")!
		
		let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
		
		Alamofire.download(
			url,
			method: .get,
			parameters: nil,
			encoding: JSONEncoding.default,
			headers: nil,
			to: destination).downloadProgress(closure: { (progress) in
				print(progress)
			}).response(completionHandler: { (DefaultDownloadResponse) in
				print(DefaultDownloadResponse)
			})
	}
}
