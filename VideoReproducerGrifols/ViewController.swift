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
		let account = Account(account: "1971571407001", policyKey: "BCpkADawqM3NLoL6I0rwEUxKX7Z8Bywq0wYl45W114Ffm2BEyYs5IHB8bV8jZtjAlxg_xQYdHY_HHSYd9rdRNpcgel15LGfCzhNuQfAcNMDH5-3ZCsC0RLViXKHQ_lVPf8_YAQ1KaLoGIjEo")
		let video = Video(id: "5072413926001")
		
		var downloader = BrigthcoveVideoDownloader(account: account, video: video)
		downloader.download {
			print("Downloaded")
		}
//		let controller = BrightcoveReproducerController(account: account, video: video)
//		navigationController?.present(controller, animated: true)
	}
}
