//
//  CoinViewController.swift
//  cryptocurrency app
//
//  Created by Grady Jenkins on 1/9/18.
//  Copyright © 2018 Grady Jenkins. All rights reserved.
//

import UIKit
import SwiftChart

class CoinViewController: UIViewController, ChartDelegate {
    let coin: Coin
    let queryService = QueryService()
    var data: [CoinData]?
    
    init(_ coin: Coin) {
        self.coin = coin
        super.init(nibName: nil, bundle: nil)
        queryService.getTicker("https://min-api.cryptocompare.com/data/histoday?fsym="+coin.symbol+"&tsym=USD&limit=60&aggregate=3&e=CCCAGG") { (results, error) in
            if let result = results {
                self.data = result
                self.SetUpChart()
            }
        }
        setupView()
    }
    
    private func SetUpChart(){
        var values = [Float]()
        var dates = [String]()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMM yy"
        if let data = self.data {
            for item in data {
                values.append(Float(item.high))
                let date = Date(timeIntervalSince1970: item.time)
                dates.append(dateFormatter.string(from: date))
            }
        }
        let series = ChartSeries(values)
        series.color = ChartColors.darkRedColor()
        series.area = true
        self.chart.add(series)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        //self.view.addSubview(nameLabel)
        self.view.addSubview(rankLabel)
        self.view.addSubview(priceLabel)
        self.view.addSubview(chart)
        self.view.addSubview(containerView)
        rankLabel.text = "Rank "+coin.rank
        priceLabel.text = "$"+coin.priceUSD
        self.title = coin.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    let change1hLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change24hLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change7dLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let chart: Chart = {
        let chart = Chart(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    func didTouchChart(_ chart: Chart, indexes: Array<Int?>, x: Float, left: CGFloat) {
        
    }
    
    func didFinishTouchingChart(_ chart: Chart) {
        
    }
    
    func setupView() {
        let guide = view.safeAreaLayoutGuide
        rankLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        rankLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        priceLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 40).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70).isActive = true
        chart.topAnchor.constraint(equalTo: guide.topAnchor, constant: 80).isActive = true
        chart.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        chart.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        chart.heightAnchor.constraint(equalToConstant: 150).isActive = true
        containerView.topAnchor.constraint(equalTo: chart.bottomAnchor, constant: 50).isActive = true
        containerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
