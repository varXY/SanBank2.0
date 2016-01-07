//
//  AddEvent.swift
//  SanBank2.0
//
//  Created by 文川术 on 15/6/26.
//  Copyright (c) 2015年 肖瑶. All rights reserved.
//

import UIKit

protocol AddEventViewControllerDelegate: class {
    func addEventViewController(controller: AddEventViewController, didFinishAddingEvent event: Event)
}

class AddEventViewController: UITableViewController {

    var newEvent = Event(name: "", san: 0)
    weak var delegate: AddEventViewControllerDelegate?

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var sanLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.becomeFirstResponder()
        sanLabel.keyboardType = UIKeyboardType.NumbersAndPunctuation
    }

	@IBAction func done(sender: AnyObject) {
		if let san = Int(sanLabel.text) {
			newEvent.name = nameLabel.text
			newEvent.san = san
			delegate?.addEventViewController(self, didFinishAddingEvent: newEvent)
			dismissViewControllerAnimated(true , completion: nil)
		}
	}
    
	@IBAction func cancel(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}

}
