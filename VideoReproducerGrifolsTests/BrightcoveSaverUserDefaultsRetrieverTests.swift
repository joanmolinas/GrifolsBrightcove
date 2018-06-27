//
//  BrightcoveSaverUserDefaultsRetrieverTests.swift
//  VideoReproducerGrifolsTests
//
//  Created by Joan Molinas Ramon on 26/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import XCTest
@testable import VideoReproducerGrifols

class BrightcoveSaverUserDefaultsRetrieverTests: XCTestCase {
	
	private var userDefaults: UserDefaults = {
		return UserDefaults(suiteName: "com.atlabs.tests.userDefaults")!
	}()
	
	
	private var videos: [(video: Video, path: String)] = {
		return [
			(Video(id: "1"), "/var/tmp/1"),
			(Video(id: "2"), "/var/tmp/2"),
			(Video(id: "3"), "/var/tmp/3"),
			(Video(id: "4"), "/var/tmp/4"),
			(Video(id: "5"), "/var/tmp/5"),
		]
	}()
	
	func testsSaver() {
		var saver = BrightcoveVideoUserDefaultsSaver(userDefaults: userDefaults)
		let retriever = BrightcoveVideoUserDefaultsRetriever(userDefaults: userDefaults)
		
		videos.forEach {
			saver.save(video: $0.video, path: $0.path)
		}
		
		videos.forEach {
			XCTAssertNotNil(retriever.retrieve(video: $0.video))
			XCTAssertEqual(retriever.retrieve(video: $0.video)!, URL(fileURLWithPath: $0.path))
			userDefaults.removeObject(forKey: $0.video.id)
		}
	}
}
