//
//  ColorCollectionView.swift
//  EFColorPicker_Example
//
//  Created by Simon He on 4/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class DefaultColorsDelegateAndDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var colors: [UIColor] = []
    
    static let defaultColors = [
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.layer.borderWidth = CGFloat(0.5)
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 5
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
}
