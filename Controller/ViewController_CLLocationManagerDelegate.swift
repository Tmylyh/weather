//
//  ViewController_CLLocationManagerDelegate.swift
//  Weather
//
//  Created by liyuehang on 2022/5/16.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lon = locations[0].coordinate.longitude
        let lat = locations[0].coordinate.latitude
       
        AF.request(kQWeatherNowPath, parameters: getParameters("\(lon),\(lat)")).responseJSON { response in
            if let data = response.value{
                let weatherJSON = JSON(data)
                self.showWeather(weatherJSON)
            }
        }
        
        AF.request(kQWeatherCityPath, parameters: getParameters("\(lon),\(lat)")).responseJSON{
            response in
            if let data = response.value{
                let cityJSON = JSON(data)
//                print(cityJSON)
                self.showCity(cityJSON)
            }
        }
    }
}
