//
//  BrightcoveProxy.swift
//  VideoReproducerGrifols
//
//  Created by Joan Molinas Ramon on 15/6/18.
//  Copyright © 2018 Joan Molinas Ramon. All rights reserved.
//

import Foundation
import BrightcovePlayerSDK

extension BCOVFPSBrightcoveAuthProxy {
	static let sharedInstance: BCOVFPSBrightcoveAuthProxy? = BCOVFPSBrightcoveAuthProxy(publisherId: nil, applicationId: nil)
}
