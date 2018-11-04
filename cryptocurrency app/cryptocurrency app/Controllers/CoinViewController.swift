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
        self.setupView()
    }
    
    //TODO - Add Dates to chart
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
        series.area = true
        series.color = .black
        series.line = false
        chart.add(series)
        self.chart.setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9882, green: 0.9882, blue: 0.9882, alpha: 1.0) /* #fcfcfc */
        
        rankLabel.text = "Rank "+coin.rank
        priceLabel.text = "$"+coin.priceUSD
        change1hLabel.text = coin.percentChange_1h
        change24hLabel.text = coin.percentChange_24h
        change7dLabel.text = coin.percentChange_7d
        
        self.view.addSubview(rankLabel)
        self.view.addSubview(priceLabel)
        self.view.addSubview(chart)
        self.view.addSubview(containerView)
        self.view.addSubview(change1hLabel)
        self.view.addSubview(change24hLabel)
        self.view.addSubview(change7dLabel)
        self.view.addSubview(change1hTextLabel)
        self.view.addSubview(change24hTextLabel)
        self.view.addSubview(change7dTextLabel)
        self.view.addSubview(touchLabel)
        self.view.addSubview(changeLabel)
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
        label.textColor = .black
        return label
    }()
    
    let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1.0) /* #f2f2f2 */
        return view
    }()
    
    let change1hTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "1h"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change1hLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change24hTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "24h"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change24hLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change7dTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "7d"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change7dLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let touchLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changeLabel: UILabel = {
        let label = UILabel()
        label.text = "Change"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var chart: Chart = {
        let chart = Chart(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.gridColor = UIColor(red: 0.9373, green: 0.9373, blue: 0.9373, alpha: 0)
        chart.labelColor = UIColor(red: 0.9373, green: 0.9373, blue: 0.9373, alpha: 0)
        chart.delegate = self
        return chart
    }()

    
    func didTouchChart(_ chart: Chart, indexes: Array<Int?>, x: Float, left: CGFloat) {
        for (seriesIndex, dataIndex) in indexes.enumerated() {
            if dataIndex != nil {
                // The series at `seriesIndex` is that which has been touched
                let value = chart.valueForSeries(seriesIndex, atIndex: dataIndex)
                guard let safeValue = value else {
                    return
                }
                touchLabel.text = String(safeValue)
            }
        }
    }
    
    func didFinishTouchingChart(_ chart: Chart) {
        touchLabel.text = ""
    }
    
    
    
    func setupView() {
        let guide = view.safeAreaLayoutGuide
        rankLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        rankLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        priceLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor, constant: 20).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        chart.topAnchor.constraint(equalTo: guide.topAnchor, constant: 95).isActive = true
        chart.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        chart.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        chart.heightAnchor.constraint(equalToConstant: 150).isActive = true
        containerView.topAnchor.constraint(equalTo: chart.bottomAnchor, constant: 50).isActive = true
        containerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        change1hTextLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        change1hTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        change24hTextLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        change24hTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        change7dTextLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        change7dTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        change1hLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        change1hLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        change24hLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        change24hLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        change7dLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        change7dLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        touchLabel.bottomAnchor.constraint(equalTo: chart.topAnchor, constant: -10).isActive = true
        touchLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        changeLabel.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -5).isActive = true
        changeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
    }
}
