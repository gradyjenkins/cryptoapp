//
//  HomeScreenTableViewController.swift
//  cryptocurrency app
//
//  Created by Grady Jenkins on 1/3/18.
//  Copyright © 2018 Grady Jenkins. All rights reserved.
//

import UIKit

class HomeScreenTableViewController: UITableViewController {
    var coins: [Coin]?
    let queryService = QueryService()
    fileprivate let cellId = "coinCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Coins By Market Cap"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView?.backgroundColor = UIColor.white
        tableView?.register(CoinCell.self, forCellReuseIdentifier: cellId)
        
        queryService.getResults("https://api.coinmarketcap.com/v1/ticker/?limit=10") { (results, errorMessage) in
            if let results = results {
                self.coins = results
                self.tableView?.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CoinCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CoinCell
        cell.coin = coins?[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)! as! CoinCell
        if let coin = currentCell.coin {
            let newViewController = CoinViewController(coin)
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
