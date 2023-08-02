//
//  Cell.swift
//  SmileTemperature
//
//  Created by Евгений Сергеев on 02.08.2023.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temperatureImage: UIImageView!
    
    @IBOutlet weak var smileImage: UIImageView!
    
    func setTemperatureImage (_ image: String) {
        
        temperatureImage.image = UIImage(named: image)
    }
    
    func setSmileImage (_ image: String) {
        smileImage.image = UIImage(named: image)
    }
    
    
}
