//
//  CoinViewController.swift
//  cryptocurrency app
//
//  Created by Grady Jenkins on 1/9/18.
//  Copyright © 2018 Grady Jenkins. All rights reserved.
//

import UIKit

class CoinViewController: UIViewController {

    let coin: Coin
    
    init(_ coin: Coin) {
        self.coin = coin
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.view.addSubview(nameLabel)
        self.view.addSubview(rankLabel)
        self.view.addSubview(priceLabel)
        self.view.addSubview(containerView)
        //nameLabel.text = coin.name
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    func setupView() {
        let guide = view.safeAreaLayoutGuide
//        nameLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 120).isActive = true
//        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        rankLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        rankLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        priceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 40).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70).isActive = true
        containerView.topAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 50).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func loadChartData(){
        
    }
}
