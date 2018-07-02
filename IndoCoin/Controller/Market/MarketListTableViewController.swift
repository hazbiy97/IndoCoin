//
//  MarketTableViewController.swift
//  IndoCoin
//
//  Created by Nur  Hazbiy on 01/07/18.
//  Copyright © 2018 Nur  Hazbiy. All rights reserved.
//

import UIKit
class MarketTableViewController: UITableViewController {

    var dataSummary: Summary?{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            //print(dataSummary ?? nil!)
        }
    }
    
    func getData(){
        let jsonUrlString = "https://indodax.com/api/summaries"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                self.dataSummary = try JSONDecoder().decode(Summary.self, from: data)
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSummary?.tickers.coinDatas.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MarketCustTableViewCell
        
        cell.configureCellWith((dataSummary?.tickers.coinDatas[indexPath.row])!)
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            switch identifier {
            case "Show Detail":
                let marketDetailVC = segue.destination as! MarketDetailViewController
                if let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell) {
                    marketDetailVC.coinData = coinDataAtIndexPath(indexPath)
                    print("snot")
                }
            default: break
            }
        }
    }
    
    // MARK: - Helper Method
    func coinDataAtIndexPath(_ indexPath: IndexPath) -> CoinData
    {
        return (dataSummary?.tickers.coinDatas[indexPath.row])!
    }
}
