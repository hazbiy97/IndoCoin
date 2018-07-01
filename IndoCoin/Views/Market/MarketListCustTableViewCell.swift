//
//  MarketCustTableViewCell.swift
//  IndoCoin
//
//  Created by Nur  Hazbiy on 01/07/18.
//  Copyright © 2018 Nur  Hazbiy. All rights reserved.
//

import UIKit

class MarketCustTableViewCell: UITableViewCell {

    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    
    func configureCellWith(_ data: CoinData)
    {
        companyLabel.text = data.name
        highLabel.text = data.high
        lowLabel.text = data.low
    }
}
