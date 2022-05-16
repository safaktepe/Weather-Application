//
//  HourlyWeather.swift
//  Weather Application
//
//  Created by Mert Şafaktepe on 15.05.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class HourlyForecast {
    
   private var _date: Date!
   private var _temp: Double!
   private var _weatherIcon: String!
    
    var date: Date {
            if _date == nil {
                _date = Date()
            }
            return _date
        }
    var temp: Double {
        if _temp == nil {
            _temp = 0.0
        }
        return _temp
    }
    var weatherIcon: String {
        if _weatherIcon == nil {
            _weatherIcon = ""
        }
        return _weatherIcon
    }
    
    init(weatherDictionary: Dictionary<String, AnyObject>) {
        let json = JSON(weatherDictionary)
        self._temp = json["temp"].double
        self._date = currentDateFromUnix(unixDate: json["ts"].double!)
        self._weatherIcon = json["weather"]["icon"].stringValue
    }
    
    class func downloadHourlyForecastWeather(completion: @escaping (_ hourlyForecast: [HourlyForecast]) -> Void ){
    let HOURLYFORECAST_URL  = "https://api.weatherbit.io/v2.0/forecast/hourly?city=Ankara,TR&hours=24&key=1760a2c5f4294f9e96881a4f921a760b"
        
        Alamofire.request(HOURLYFORECAST_URL).responseJSON { response in
            let result = response.result
            
            var forecastArray: [HourlyForecast] = []
            
            if result.isSuccess {
                if let dictionary = result.value as? Dictionary<String, AnyObject> {
                    if let list = dictionary["data"] as? [Dictionary<String, AnyObject>] {
                        for item in list {
                            let forecast = HourlyForecast(weatherDictionary: item)
                            forecastArray.append(forecast)
                        }
                    }
                }
                completion(forecastArray)
                 } else {
                print("no forecast data")
                completion(forecastArray)

            }
            
            
        }
        
    }
}
