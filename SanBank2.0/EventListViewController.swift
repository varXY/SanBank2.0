//
//  EventList.swift
//  SanBank2.0
//
//  Created by 文川术 on 15/6/26.
//  Copyright (c) 2015年 肖瑶. All rights reserved.
//

import UIKit

class EventListViewController: UITableViewController {

    var dataModal = DataModal()

    func addEvent(event: Event) {
        let newRowIndex = dataModal.events.count
        dataModal.events.append(event)
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModal.events.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventCell
        var newEvents = [Event]()
        newEvents = Array(dataModal.events.reverse())
        let event = newEvents[indexPath.row] as Event
        cell.nameLabel.text = event.name
        cell.sanLabel.text = String(event.san)
    
        return cell
    }
}
