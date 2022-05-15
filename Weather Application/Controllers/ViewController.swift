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

       
        HourlyForecast.downloadDailyForecastWeather()
        
        
    }


}

