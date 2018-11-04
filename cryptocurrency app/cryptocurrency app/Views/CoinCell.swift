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
            guard let symbol = coin?.symbol, let name = coin?.name, let priceUSD = coin?.priceUSD else {
                return
            }
            nameLabel.text = name
            priceUsdLabel.text = priceUSD
            symbolLabel.text = symbol
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
    
    let currencySymbol: UILabel = {
        let label = UILabel()
        label.text = "$"
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    let coinImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = true
        return image
    }()
    
    func setupView() {
        addSubview(symbolLabel)
        addSubview(nameAndSymbolSeparator)
        addSubview(nameLabel)
        addSubview(priceUsdLabel)
        addSubview(coinImage)
        
        coinImage.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        coinImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        coinImage.image = UIImage(named: self.coin!.symbol)
        
        symbolLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        symbolLabel.leadingAnchor.constraint(equalTo: coinImage.trailingAnchor, constant: 70).isActive = true
        symbolLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameAndSymbolSeparator.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameAndSymbolSeparator.leadingAnchor.constraint(equalTo: symbolLabel.trailingAnchor, constant: 5).isActive = true
        nameAndSymbolSeparator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: nameAndSymbolSeparator.trailingAnchor, constant: 5).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        priceUsdLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        priceUsdLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        priceUsdLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
//    func setImageForCoin() -> UIImage {
//        guard let symbol = self.coin?.symbol else {
//            let image = UIImage(named: "BTC")
//            return image
//        }
//        let image = UIImage(named: symbol)
//        return image
//    }
}
