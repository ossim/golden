//
//  ViewController.swift
//  Golden
//
//  Created by Evan Chang on 4/1/17.
//  Copyright © 2017 David Xie and Evan Chang. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //@IBOutlet weak var kolodaView: KolodaView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        //kolodaView.dataSource = self
        //kolodaView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        //infinity??
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
/*
extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        dataSource.reset()
    }
    
    func koloda(koloda: KolodaView, didSelectCardAtIndex index: UInt) {
        UIApplication.shared.openURL(NSURL(string: "http://yalantis.com/")! as URL)
    }
}

extension ViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(koloda:KolodaView) -> UInt {
        return images.count
    }
    
    func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
        return UIImageView(image: images[Int(index)])
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView",
                                                  owner: self, options: nil)?[0] as? OverlayView
    }
}
*/
