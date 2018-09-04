//
//  EFDefaultColors.swift
//  EFColorPicker
//
//  Created by Simon He on 4/9/18.
//

import Foundation
import UIKit

class EFDefaultColors: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var colors: [UIColor] = []
    
    static let predefined = [
        UIColor.white,
        UIColor.black,
        UIColor.red,
        UIColor.green,
        UIColor.blue,
        UIColor.cyan,
        UIColor.yellow,
        UIColor.magenta,
        UIColor.brown,
        UIColor.gray
    ]
    
    static let cellId = "default_color_cell"
    
    func setColors(colors: [UIColor]) {
        self.colors = colors
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EFDefaultColors.cellId, for: indexPath)
        cell.layer.borderWidth = CGFloat(0.5)
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 5
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
}

