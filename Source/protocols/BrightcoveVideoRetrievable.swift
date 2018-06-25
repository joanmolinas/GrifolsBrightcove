//
//  BrightcoveVideoRetrievable.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 25/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import Foundation

protocol BrightcoveVideoRetrievable {
	func retrieve(video: Video) -> URL?
}
