//
//  APIManager.swift
//  ForecastWeather
//
//  Created by Elsa Olluri on 6/30/19.
//  Copyright © 2019 Elsa Olluri. All rights reserved.
//

import Foundation

enum APIManager {
    ///Base URL
    static let BASE_URL: String = "https://api.sunrise-sunset.org/"

    ///End Points
    static let cityWeather = BASE_URL + "json"
}
