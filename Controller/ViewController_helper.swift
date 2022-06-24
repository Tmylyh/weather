//
//  ViewController_helper.swift
//  Weather
//
//  Created by liyuehang on 2022/5/16.
//

import Foundation
import SwiftyJSON

extension ViewController{
    func showWeather(_ weatherJSON: JSON){
        //数据
        self.weather.temp = "\(weatherJSON["now","temp"].stringValue)°"
        self.weather.icon = weatherJSON["now","icon"].stringValue
        //UI
        self.tempLabel.text = self.weather.temp
        self.iconImageView.image = UIImage(named: self.weather.icon)
    }
    
    func showCity(_ cityJSON: JSON){
        //数据
        weather.city = cityJSON["location",0,"adm2"].stringValue
        //UI
        cityLabel.text = weather.city
    }
    
    func getParameters(_ location: String) -> [String: String]{
        ["location": location, "key": kQWeatherWebKey]
    }
}

