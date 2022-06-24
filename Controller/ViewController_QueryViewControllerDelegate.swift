//
//  ViewController_QueryViewControllerDelegate.swift
//  Weather
//
//  Created by liyuehang on 2022/5/16.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ViewController: QueryViewControllerDelegate{
    func didChangeCity(city: String) {
        AF.request(kQWeatherCityPath,parameters: getParameters(city)).responseJSON{
            response in
            if let data = response.value{
                let cityJSON = JSON(data)
//                print(cityJSON)
                self.showCity(cityJSON)
                
                let cityID = cityJSON["location",0,"id"].stringValue
                AF.request(kQWeatherNowPath,parameters: self.getParameters(cityID)).responseJSON { response in
                    if let data = response.value{
                        let weatherJSON = JSON(data)
                        self.showWeather(weatherJSON)
        //                print(weatherJSON["now","temp"])
                    }
                }
            }
        }
    }
}
