//
//  LogCellView.swift
//  Demo_BackgroundLocation1210
//
//  Created by leslie on 12/31/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit

class LogCellView: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var accuracyLbl: UILabel!
    @IBOutlet weak var totalDistanceLbl: UILabel!
    @IBOutlet weak var eachDistanceLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var directionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureLogCell(log: Log) {
        dateLbl.text = log.timestamp?.formatDateToString()
        accuracyLbl.text = log.accuracy.setDecimalPlaces(places: 1)
        totalDistanceLbl.text = log.totalDistance.setDecimalPlaces(places: 2)
        eachDistanceLbl.text = log.eachDistance.setDecimalPlaces(places: 2)
        speedLbl.text = log.speed.setDecimalPlaces(places: 2)
        directionLbl.text = log.direction.setDecimalPlaces(places: 1)
    }

}
