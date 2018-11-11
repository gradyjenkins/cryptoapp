//
//  UIImage+loadFromURL.swift
//  cryptocurrency app
//
//  Created by Grady Jenkins on 11/10/18.
//  Copyright © 2018 Grady Jenkins. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    typealias SuccessCompletion = (Bool) -> ()
    
    func loadImageFromUrlString(url: String, placeholder: UIImage?, completion: @escaping SuccessCompletion) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    if let data = data {
                        if let image = UIImage(data: data){
                            DispatchQueue.main.async {
                                self.image = image
                                completion(true)
                            }
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.image = placeholder
                    }
                }
            }).resume()
        } else {
            DispatchQueue.main.async {
                self.image = placeholder
            }
        }
    }
}
