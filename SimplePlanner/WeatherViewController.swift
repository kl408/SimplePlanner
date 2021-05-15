//
//  WeatherViewController.swift
//  SimplePlanner
//
//  Created by Michelle Cheng on 5/14/21.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var weather = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?id=4930956&units=imperial&appid=6ce59923b857031c5604c902d6a39661") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
                
                    let json = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Any]
                    let location = (json["name"] as! String)
                    
                    
                    let weatherDetails = json["weather"] as? [[String : Any]]
                    let weatherMain = json["main"] as? [String: Any]
                    let temp = Int(weatherMain!["temp"] as? Double ?? 0)
                    let description = (weatherDetails?.first?["description"] as? String)
                    
                    //print(location)
                    //print(temp)
                    //print(description!)
                    
                    DispatchQueue.main.async {
                        self.setWeather(weather: weatherDetails?.first?["main"] as? String, location: location, description: description, temp: temp)
 
                    }
            }
            
        }
        
        task.resume()
    }
    
    
    func setWeather(weather: String?, location: String?, description: String?, temp: Int){
            locationLabel.text = location
            weatherLabel.text = description
            tempatureLabel.text = "\(temp)°"
        }

}
