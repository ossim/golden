//
//  ViewController.swift
//  Golden
//
//  Created by Evan Chang on 4/1/17.
//  Copyright © 2017 David Xie and Evan Chang. All rights reserved.
//

import UIKit
import ForecastIO

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
        //infinity??
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "day", for: indexPath) as! DateTableViewCell
        
        let dateArray = getDateArray()
        
        cell.dateField?.text = dateArray[1]
        
        return cell
    }
    
    func getDateArray() -> [String] {
        
        let secret = "2322ff99a4fb1c71bc582476793e0af1"
        let client = DarkSkyClient(apiKey: secret)
        let myLat = 37.872618
        let myLon = -122.261042
        
        
        
        client.getForecast(latitude: myLat, longitude: myLon) { result in
            switch result {
            case .success(let forecast, let _):
                for foreday in (forecast.daily?.data)! {
                    var newday:[String]
                    newday.append(foreday.sunriseTime!)
                    
                    print(foreday.sunriseTime!)
                }
                
                print(forecast.daily!)
            case .failure(let error):
                print(error)
            }
        }
        
        let dateArray = ["hi", "hello"]
        
        return dateArray
    }
    
    
}
