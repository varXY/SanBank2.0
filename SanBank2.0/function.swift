//
//  function.swift
//  SanBank2.0
//
//  Created by 文川术 on 15/8/3.
//  Copyright (c) 2015年 肖瑶. All rights reserved.
//

import Foundation
import Dispatch

func afterDelay(seconds: Double, closure: () -> ()) {
	let when = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
	dispatch_after(when, dispatch_get_main_queue(), closure)
}
