//
//  SanView.swift
//  SanBank2.0
//
//  Created by 文川术 on 15/6/26.
//  Copyright (c) 2015年 肖瑶. All rights reserved.
//

import UIKit



class SanViewController: UIViewController, AddEventViewControllerDelegate {

    var dataModal: DataModal?

    @IBOutlet weak var sanLabel: UILabel!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        sanLabel.text = String(dataModal!.sanForNow)
    }

	@IBAction func goodLuck(sender: AnyObject) {
		var randomSan = Int((arc4random() % 100000) / 1000)
		let randomPlus = arc4random_uniform(100)

		if randomPlus > 49 && randomPlus < 99 {
			randomSan = -randomSan
		}

		if randomPlus == 99 {
			randomSan = 100000
		}

		dataModal?.sanForNow += randomSan

		let hudView = HudView.hudInView(self.view, animated: true)

		if randomSan > 0 {
			hudView.text = "you got \(randomSan)"
		}

		if randomSan < 0 {
			hudView.text = "you lost \(-randomSan)"
		}

		if randomSan == 0 {
			hudView.text = "you got 0, try again"
		}

		afterDelay(0.6, closure: { () -> () in
			hudView.removeFromSuperview()
			self.view.userInteractionEnabled = true
			self.sanLabel.text = String(self.dataModal!.sanForNow)
		})
	}

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddEvent" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! AddEventViewController
            controller.delegate = self
        }

        if segue.identifier == "List" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! EventListViewController
            controller.dataModal = dataModal!

        }
    }

    func addEventViewController(controller: AddEventViewController, didFinishAddingEvent event: Event) {
        dataModal?.events.append(event)
        dataModal?.sanForNow += event.san
		dataModal?.saveEventlistItems()
    }
}
