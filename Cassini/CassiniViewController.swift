//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Ali Siddiqui on 8/12/16.
//  Copyright © 2016 Ali Siddiqui. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let destinationvc = segue.destination as? ImageViewController {
                destinationvc.title = (sender as? UIButton)?.currentTitle
                switch identifier {
                case "Show Earth":
                    destinationvc.url = "http://ichef-1.bbci.co.uk/news/976/media/images/83351000/jpg/_83351965_explorer273lincolnshirewoldssouthpicturebynicholassilkstone.jpg"
                case "Show Cassini":
                    destinationvc.url = "http://ichef-1.bbci.co.uk/news/976/media/images/83351000/jpg/_83351965_explorer273lincolnshirewoldssouthpicturebynicholassilkstone.jpg"
                case "Show Saturn":
                    destinationvc.url = "http://ichef-1.bbci.co.uk/news/976/media/images/83351000/jpg/_83351965_explorer273lincolnshirewoldssouthpicturebynicholassilkstone.jpg"
                default: break
                }
            }
        }
    }
    
    override func viewDidLoad() {
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contentViewController == self {
            if let destinationvc = secondaryViewController.contentViewController as? ImageViewController, destinationvc.url == "" {
                return true
            }
        }
        return false
    }

}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
