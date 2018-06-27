//
//  BrightcoveVideoUserDefaultsSaver.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 25/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import Foundation

public struct BrightcoveVideoUserDefaultsSaver: BrightcoveVideoSaveable {
	
	// MARK: - Properties
	private(set) var userDefaults: UserDefaults!
	
	// MARK: - Life cycle
	init(userDefaults: UserDefaults = .standard) {
		self.userDefaults = userDefaults
	}
	
	// MARK: - API
	mutating public func save(video: Video, path: String) {
		userDefaults.set(path, forKey: video.id)
	}
}
