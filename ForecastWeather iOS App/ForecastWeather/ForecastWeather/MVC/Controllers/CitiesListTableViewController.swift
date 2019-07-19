//
//  CitiesListTableViewController.swift
//  ForecastWeather
//
//  Created by Elsa Olluri on 6/30/19.
//  Copyright © 2019 Elsa Olluri. All rights reserved.
//

import UIKit

class CitiesListTableViewController: UITableViewController {

    // Guard for memory retain cycles [weak]
    weak var cityDetailsViewController: CityDetailsViewController?

    // Static segue identifier in storyboard
    let cityDetailsSegueIdentifier = "CityDetailsViewControllerSegue"

    private let cities: [CityDetailsModel] = [CityDetailsModel(cityName: "California", cityLatitude: "36.7783", cityLongitude: "119.4179"),
                                       CityDetailsModel(cityName: "London", cityLatitude: "51.5074", cityLongitude: "0.1278"),
                                       CityDetailsModel(cityName: "Paris", cityLatitude: "48.8566", cityLongitude: "2.3522"),
                                       CityDetailsModel(cityName: "Berlin", cityLatitude: "52.5200", cityLongitude: "13.4050")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cityDetails = segue.destination as? CityDetailsViewController {
            cityDetailsViewController = cityDetails
        }
    }
}

extension CitiesListTableViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Guards
        guard let cityCardCell: CityCardTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CityCardTableViewCell", for: indexPath) as? CityCardTableViewCell else {
            assertionFailure("Can not read: CityCardTableViewCell")
            return UITableViewCell()
        }

        let city = cities[indexPath.row]
        let cityImageName = city.name ?? "cityPlaceHolder"

        cityCardCell.cityImage.image = UIImage(named: cityImageName)
        cityCardCell.cityNameLabel.text = city.name
        cityCardCell.cityWeatherDetailsLabel.text = "\(city.temperature)°C"

        return cityCardCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        self.performSegue(withIdentifier: cityDetailsSegueIdentifier, sender: nil)
        cityDetailsViewController?.cityDetailsModel = cities[row]
    }
}
