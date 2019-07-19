//
//  CityCardTableViewCell.swift
//  ForecastWeather
//
//  Created by Elsa Olluri on 6/30/19.
//  Copyright © 2019 Elsa Olluri. All rights reserved.
//

import UIKit

class CityCardTableViewCell: UITableViewCell {

    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityWeatherDetailsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
