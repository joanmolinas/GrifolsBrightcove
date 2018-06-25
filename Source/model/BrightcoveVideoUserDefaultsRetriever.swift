//
//  BrightcoveVideoRetriever.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 25/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import Foundation

public struct BrightcoveVideoUserDefaultsRetriever: BrightcoveVideoRetrievable {
	func retrieve(video: Video) -> URL? {
		guard let sUrl = UserDefaults.standard.string(forKey: video.id) else { return nil }
		return URL(fileURLWithPath: sUrl)
	}
}
