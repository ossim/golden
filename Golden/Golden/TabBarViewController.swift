//
//  TabBarViewController.swift
//  Golden
//
//  Created by Evan Chang on 5/2/17.
//  Copyright © 2017 David Xie and Evan Chang. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController : UIViewController {
    
    var selectedIndex: Int = 0

    var viewControllers: [UIViewController]!

    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var contentView: UIView!
    
    @IBAction func didSelectTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)

    }
    
    var datesViewController: UIViewController!
    var mapViewController: UIViewController!

    override func viewDidLoad() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        datesViewController = storyboard.instantiateViewController(withIdentifier: "DatesViewController")
        
        mapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController")
        
        viewControllers = [datesViewController, mapViewController]

        buttons[selectedIndex].isSelected = true
        didSelectTab(buttons[selectedIndex])
    }
}
