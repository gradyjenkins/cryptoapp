//
//  CoinCell.swift
//  cryptocurrency app
//
//  Created by Grady Jenkins on 1/4/18.
//  Copyright © 2018 Grady Jenkins. All rights reserved.
//

import UIKit

class CoinCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var coin: Coin? {
        didSet {
            nameLabel.text = coin?.name
            priceUsdLabel.text = coin?.priceUSD
            symbolLabel.text = coin?.symbol
            percentChange1hLabel.text = coin?.percentChange_1h 
            percentChange24hLabel.text = coin?.percentChange_24h
        }
    }
    
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameAndSymbolSeparator: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "|"
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceUsdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let percentChange1hLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let percentChange24hLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView() {
        
        addSubview(symbolLabel)
        symbolLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        symbolLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70).isActive = true
        symbolLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addSubview(nameAndSymbolSeparator)
        nameAndSymbolSeparator.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameAndSymbolSeparator.leadingAnchor.constraint(equalTo: symbolLabel.trailingAnchor, constant: 5).isActive = true
        nameAndSymbolSeparator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: nameAndSymbolSeparator.trailingAnchor, constant: 5).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addSubview(priceUsdLabel)
        priceUsdLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        priceUsdLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        priceUsdLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addSubview(percentChange1hLabel)
        percentChange1hLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        percentChange1hLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        addSubview(percentChange24hLabel)
        percentChange24hLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        percentChange24hLabel.leadingAnchor.constraint(equalTo: percentChange1hLabel.trailingAnchor, constant: 50).isActive = true
    }
}
