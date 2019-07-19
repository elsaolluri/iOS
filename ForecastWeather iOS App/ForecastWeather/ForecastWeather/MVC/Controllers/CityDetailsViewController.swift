//
//  CityDetailsViewController.swift
//  ForecastWeather
//
//  Created by Elsa Olluri on 6/30/19.
//  Copyright © 2019 Elsa Olluri. All rights reserved.
//

import UIKit


class CityDetailsViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var dayLengthLabel: UILabel!

    var cityDetailsModel: CityDetailsModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set viewcontroller title
        self.title = "Details"

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Get City details
        getCityDetails()
    }

    func getCityDetails() {
        guard let longitude = cityDetailsModel.latitude, let latitude = cityDetailsModel.longitude else {
            return
        }

        // Parameters to get city details from API
        // Longitude: "lat" (requried)
        // Latitude: "lat" (required)
        // Date : "date" (required)
        let getCityDetails: [String: String] = ["lat":latitude,
                                                      "lng":longitude,
                                                      "date":"today"]

        APIRequest.GetCityDetails(parameters: getCityDetails) { (cityDetails) in
            // Update UI

            guard let sunrise = cityDetails.sunrise, let sunset = cityDetails.sunset, let dayLength = cityDetails.dayLength else {
                assertionFailure("Could not read data from APIRequest!")
                return
            }

            let cityName = self.cityDetailsModel.name ?? "City not found"
            let cityImageName = self.cityDetailsModel.name ?? "cityPlaceHolder"
            let temperature = self.cityDetailsModel.temperature

            self.cityNameLabel.text = cityName
            self.cityImage.image = #imageLiteral(resourceName: cityImageName) /* Use of image literals, advantages of non-optional type*/
            self.sunriseLabel.text = sunrise
            self.sunsetLabel.text = sunset
            self.temperatureLabel.text = String(temperature)
            self.dayLengthLabel.text = dayLength
        }
    }
}
