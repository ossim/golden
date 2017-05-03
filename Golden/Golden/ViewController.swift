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
    
    var dateArray : [[String]] = [["","","","","","",""],["","","","","","",""],["","","","","","",""],["","","","","","",""],["","","","","","",""],["","","","","","",""],["","","","","","",""]]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        dateArray = getDateArray()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "day", for: indexPath) as! DateTableViewCell
        cell.dateField?.text = dateArray[indexPath.row][0]
        cell.mStart?.text = dateArray[indexPath.row][1]
        cell.mEnd?.text = dateArray[indexPath.row][2]
        cell.eStart?.text = dateArray[indexPath.row][3]
        cell.eEnd?.text = dateArray[indexPath.row][4]
        cell.mTemp?.text = dateArray[indexPath.row][5]
        cell.eTemp?.text = dateArray[indexPath.row][6]

        return cell
    }
    
    func getDateArray() -> [[String]] {
        
        let secret = "2322ff99a4fb1c71bc582476793e0af1"
        let client = DarkSkyClient(apiKey: secret)
        let myLat = 37.872618
        let myLon = -122.261042
        
        client.getForecast(latitude: myLat, longitude: myLon) { result in
            switch result {
            case .success(let forecast, _):

                self.dateArray = []

                for foreday in (forecast.daily?.data)! {
                    
                    var newday : [String] = []

                    let timeFormatter = DateFormatter()
                    timeFormatter.dateStyle = .none
                    timeFormatter.timeStyle = .short
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .short
                    dateFormatter.timeStyle = .none
                    
                    
                    // 0 date
                    newday.append(dateFormatter.string(from: foreday.sunriseTime!))
                    
                    print(dateFormatter.string(from: foreday.sunriseTime!))
                    
                    // 1 sunrise start
                    newday.append(timeFormatter.string(from: foreday.sunriseTime!))
                    
                    print(timeFormatter.string(from: foreday.sunriseTime!))
                    
                    // 2 sunrise end
                    let riseEnd = foreday.sunriseTime!.addingTimeInterval(3600)
                    newday.append(timeFormatter.string(from: riseEnd))
                    
                    print(timeFormatter.string(from: riseEnd))
                    
                    // 3 sunset start
                    
                    let setStart:Date = foreday.sunsetTime!.addingTimeInterval(-3600)
                    newday.append(timeFormatter.string(from: setStart))
                    
                    print(timeFormatter.string(from: setStart))
                    
                    
                    // 4 sunset end
                    
                    newday.append(timeFormatter.string(from: foreday.sunsetTime!))
                    
                    print(timeFormatter.string(from: foreday.sunsetTime!))
                    
                    // 5 tempmin
                    newday.append(String(foreday.temperatureMin!) + "\u{00B0}F")

                    print(String(foreday.temperatureMin!))
                    
                    //6 tempmax
                    newday.append(String(foreday.temperatureMax!) + "\u{00B0}F")
                    
                    print(String(foreday.temperatureMax!))
                    
                    self.dateArray.append(newday)
                }
            case .failure(let error):
                print(error)
            }
            print(self.dateArray)
            self.tableViewOutlet.reloadData()
        }
        return dateArray
    }
    
    
}
