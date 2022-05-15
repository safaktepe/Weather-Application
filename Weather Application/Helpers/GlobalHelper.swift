//
//  GlobalHelper.swift
//  Weather Application
//
//  Created by Mert Şafaktepe on 15.05.2022.
//

import Foundation


func currentDateFromUnix (unixDate: Double?) -> Date? {
    if unixDate != nil {
        return Date(timeIntervalSince1970: unixDate!)
    }
    else {
        return Date()
    }
}
