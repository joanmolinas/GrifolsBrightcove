//
//  BrightcoveVideoDownloader.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 20/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import Foundation
import BrightcovePlayerSDK
import Alamofire

public class BrightcoveVideoDownloader: BrightcoveVideoDownloadable {
	
	// MARK: - Properties
	let video: Video
	let account: Account
	private(set) var saver: BrightcoveVideoSaveable
	private lazy var playbackService: BCOVPlaybackService = {
		return BCOVPlaybackService(accountId: account.account, policyKey: account.policyKey)
	}()
	
	// MARK: - Life cycle
	required public init(account: Account, video: Video, saver: BrightcoveVideoSaveable) {
		self.account = account
		self.video = video
		self.saver = saver
	}
	
	// MARK: - API
	public func download(completion: @escaping (Error?) -> Void) {
		playbackService.findVideo(
			withVideoID: video.id,
			parameters: nil)
		{ (video: BCOVVideo?, jsonResponse:  [AnyHashable: Any]?, error: Error?) -> Void in
			
			if let v = video {
				self._download(v, completion: completion)
			} else {
				print("BrightcoveVideoDownloader error downloading video: " + error!.localizedDescription)
			}
		}
	}
	
	private func _download(_ video: BCOVVideo,
						   completion: @escaping (Error?) -> Void,
						   progressHandler:((Progress) -> Void)? = nil) {
		let source = video.sources.first! as! BCOVSource
		let url = source.url!

		let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
		
		Alamofire.download(
			url,
			method: .get,
			parameters: nil,
			encoding: JSONEncoding.default,
			headers: nil,
			to: destination)
			.downloadProgress(closure: { (progress) in
				print(progress)
				progressHandler?(progress)
			})
			.response(completionHandler: {  (downloadResponse) in
				guard let response = downloadResponse.response, response.statusCode == 200 else {
					let error = NSError(domain: "com.atlabs.videoReproducerGrifols", code: 500)
					completion(error)
					return
				}
				
				let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/" + (response.suggestedFilename ?? "")
				self.saver.save(video: self.video, path: documentsPath)
			})
	}
}
