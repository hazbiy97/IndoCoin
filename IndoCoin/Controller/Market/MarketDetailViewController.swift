//
//  MarketDetailViewController.swift
//  IndoCoin
//
//  Created by Nur  Hazbiy on 02/07/18.
//  Copyright © 2018 Nur  Hazbiy. All rights reserved.
//

import UIKit

class MarketDetailViewController: UIViewController {

    var coinData: CoinData?
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = coinData?.name
        companyLabel.text = coinData?.name
        highLabel.text = coinData?.high
        lowLabel.text = coinData?.low
        buyLabel.text = coinData?.buy
        sellLabel.text = coinData?.sell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
