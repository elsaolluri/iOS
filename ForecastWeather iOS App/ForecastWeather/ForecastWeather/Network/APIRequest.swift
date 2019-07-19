//
//  APIRequest.swift
//  ForecastWeather
//
//  Created by Elsa Olluri on 6/30/19.
//  Copyright © 2019 Elsa Olluri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import KVNProgress

class APIRequest {
    class func GetCityDetails(parameters: [String : String], completionHandler:@escaping (CityDetailsModel) -> ()){

        KVNProgress.show(withStatus: "Loading Weather..")
        Alamofire.request(APIManager.cityWeather, method: .get, parameters: parameters).responseJSON { response in
            KVNProgress.dismiss()
            if let serverResponse = response.result.value {
                let jsonResponse = JSON(serverResponse)
                if let success = jsonResponse["status"].string, success == "OK" {
                    let results = jsonResponse["results"]
                    
                    let sunrise = results["sunrise"].stringValue
                    let sunset = results["sunset"].stringValue
                    let dayLength = results["day_length"].stringValue


                    let cityWeather: CityDetailsModel = CityDetailsModel(citySunRise: sunrise, citySunSet: sunset, cityDayLength: dayLength)
                    completionHandler(cityWeather)
                } else {
                    print("There was an error reading response!")
                }
            } else {
                print("There was an error connecting to server!")
            }
        }
    }
}
