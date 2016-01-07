//
//  Event.swift
//  SanBank2.0
//
//  Created by 文川术 on 15/6/26.
//  Copyright (c) 2015年 肖瑶. All rights reserved.
//

import Foundation

class Event: NSObject, NSCoding {
    var name: String
    var san: Int

    init(name: String, san: Int) {
        self.name = name
        self.san = san
        super.init()
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeInteger(san, forKey: "San")
    }

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        san = aDecoder.decodeIntegerForKey("San")
    }
}