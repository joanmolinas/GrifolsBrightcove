//
//  BrightcoveVideoUserDefaultsSaver.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 25/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import Foundation

struct BrightcoveVideoUserDefaultsSaver: BrightcoveVideoSaveable {
	func save(video: Video, path: String) {
		UserDefaults.standard.set(path, forKey: video.id)
	}
}
