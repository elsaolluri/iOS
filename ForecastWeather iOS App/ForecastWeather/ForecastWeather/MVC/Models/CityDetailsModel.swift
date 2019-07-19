//
//  CityDetailsModel.swift
//  ForecastWeather
//
//  Created by Elsa Olluri on 6/30/19.
//  Copyright © 2019 Elsa Olluri. All rights reserved.
//

import Foundation

class CityDetailsModel {
    var name: String?
    let temperature = Int.random(in: 17 ..< 36) /* We could not find public api to read correct weather for selected city */
    var sunrise: String?
    var sunset: String?
    var dayLength: String?
    var longitude: String?
    var latitude: String?

    init() {}

    init(cityName: String, cityLatitude: String, cityLongitude: String) {
        self.name = cityName
        self.latitude = cityLatitude
        self.longitude = cityLongitude
    }

    init(citySunRise: String, citySunSet: String, cityDayLength: String) {
        self.sunset = citySunSet
        self.sunrise = citySunRise
        self.dayLength = cityDayLength
    }
}
