//
//  DataModal.swift
//  SanBank2.0
//
//  Created by 文川术 on 15/7/15.
//  Copyright (c) 2015年 肖瑶. All rights reserved.
//

import Foundation

class DataModal {
    var events = [Event]()
    var sanForNow: Int = 0

    init() {
        loadEventlistItem()
    }

    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) 
        return paths[0]
    }

    func dataFilePath() -> String {
        return (documentsDirectory() as NSString).stringByAppendingPathComponent("Eventlists.plist")
    }

    func saveEventlistItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(events, forKey: "EventlistItems")
        archiver.encodeInteger(sanForNow, forKey: "SanForNow")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }

    func loadEventlistItem() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                events = unarchiver.decodeObjectForKey("EventlistItems") as! [Event]
                sanForNow = unarchiver.decodeIntegerForKey("SanForNow")
                unarchiver.finishDecoding()
            }
        }
    }

}