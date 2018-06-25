//
//  ViewController.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 14/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func watchWasPressed(_ sender: UIButton) {
		let video = Video(id: "5072413926001")
		
		
		//		let controller = BrightcoveReproducerController(account: account, video: video)
		let controller = BrightcoveViewerController(video: video)
		navigationController?.present(controller, animated: true)
	}
	
	@IBAction func downloadWasPressed(_ sender: UIButton) {
		let account = Account(account: "1971571407001", policyKey: "BCpkADawqM3NLoL6I0rwEUxKX7Z8Bywq0wYl45W114Ffm2BEyYs5IHB8bV8jZtjAlxg_xQYdHY_HHSYd9rdRNpcgel15LGfCzhNuQfAcNMDH5-3ZCsC0RLViXKHQ_lVPf8_YAQ1KaLoGIjEo")
		let video = Video(id: "5072413926001")
		
		let saver = BrightcoveVideoUserDefaultsSaver()
		let downloader = BrightcoveVideoDownloader(account: account, video: video, saver: saver)
		downloader.download {error in
			if let e = error {
				print(e)
			} else {
				print("Downloaded")
			}
			
		}
	}
}

