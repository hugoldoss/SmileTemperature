//
//  ViewController.swift
//  SmileTemperature
//
//  Created by Евгений Сергеев on 02.08.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    
    
    
    var arrayTemperature = [String]()
    
    var arraySmile = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
        
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        
        arrayTemperature.append("temp.green")
        arrayTemperature.append("temp.blackGreen")
        arrayTemperature.append("temp.lightYellow")
        arrayTemperature.append("temp.darkYellow")
        arrayTemperature.append("temp.orange")
        arrayTemperature.append("temp.red")
        
        arraySmile.append("favorite")
        arraySmile.append("nice")
        arraySmile.append("routine")
        arraySmile.append("notPleasant")
        arraySmile.append("bad")
        arraySmile.append("hate")
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOne {
            return arrayTemperature.count
        }
        if collectionView == collectionViewTwo {
            return arraySmile.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewOne {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as! Cell
            cell.setTemperatureImage(arrayTemperature[indexPath.row])
            return cell
        }
        
        if collectionView == collectionViewTwo {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as! Cell
            cell.setSmileImage(arraySmile[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC else { return }
        
        if collectionView == collectionViewOne {
            let currentImage = arrayTemperature[indexPath.row]
            vc.setImageName(currentImage)
            present(vc, animated: true)
    }
        if collectionView == collectionViewTwo {
            let currentImage = arraySmile[indexPath.row]
            vc.setImageName(currentImage)
            present(vc, animated: true)
    }
    }
    

}

