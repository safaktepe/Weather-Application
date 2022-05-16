//
//  ViewController.swift
//  Weather Application
//
//  Created by Mert Şafaktepe on 15.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        WeeklyWeatherForecast.downloadWeeklyForecastWeather { weeklyArray in
            for forecast in weeklyArray {
                print("forecast info: \(forecast.date) \t \(forecast.temp) \t \(forecast.weatherIcon)")
            }
        }
        
        
        
        
    }


}

