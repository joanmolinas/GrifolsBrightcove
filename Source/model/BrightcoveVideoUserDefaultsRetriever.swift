//
//  BrightcoveVideoRetriever.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 25/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import Foundation

public struct BrightcoveVideoUserDefaultsRetriever: BrightcoveVideoRetrievable {
	
	// MARK: - Properties
	private(set) var userDefaults: UserDefaults!
	
	// MARK: - Life cycle
	init(userDefaults: UserDefaults = .standard) {
		self.userDefaults = userDefaults
	}
	
	// MARK: - API
	public func retrieve(video: Video) -> URL? {
		guard let sUrl = userDefaults.string(forKey: video.id) else { return nil }
		return URL(fileURLWithPath: sUrl)
	}
}
