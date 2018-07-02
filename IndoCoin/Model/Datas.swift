//
//  Data.swift
//  IndoCoin
//
//  Created by Nur  Hazbiy on 01/07/18.
//  Copyright © 2018 Nur  Hazbiy. All rights reserved.
//

import UIKit

struct CoinData: Decodable {
    let name: String
    let high: String
    let low: String
    let vol_idr: String
    let last: String
    let buy: String
    let sell: String
    let server_time: Int
}

struct Summary:Decodable{
    struct Tickers:Decodable{
        var coinDatas:[CoinData]
        
        // MARK: Decodable
        
        private enum CodingKeys: String, CodingKey {
            case btc_idr = "btc_idr"
            case act_idr = "act_idr"
            case ada_idr = "ada_idr"
            case bcd_idr = "bcd_idr"
            case bch_idr = "bch_idr"
            case btg_idr = "btg_idr"
            case eth_idr = "eth_idr"
            case etc_idr = "etc_idr"
        }
        
        // MARK: Decoder (custom)
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            coinDatas = [CoinData]()
            let btc_idr = try container.decode(CoinData.self, forKey: .btc_idr)
            coinDatas.append(btc_idr)
            let act_idr = try container.decode(CoinData.self, forKey: .act_idr)
            coinDatas.append(act_idr)
            let ada_idr = try container.decode(CoinData.self, forKey: .ada_idr)
            coinDatas.append(ada_idr)
            let bcd_idr = try container.decode(CoinData.self, forKey: .bcd_idr)
            coinDatas.append(bcd_idr)
            let bch_idr = try container.decode(CoinData.self, forKey: .bch_idr)
            coinDatas.append(bch_idr)
            let btg_idr = try container.decode(CoinData.self, forKey: .btg_idr)
            coinDatas.append(btg_idr)
            let eth_idr = try container.decode(CoinData.self, forKey: .eth_idr)
            coinDatas.append(eth_idr)
            let etc_idr = try container.decode(CoinData.self, forKey: .etc_idr)
            coinDatas.append(etc_idr)
        }
    }

    let tickers:Tickers
}

