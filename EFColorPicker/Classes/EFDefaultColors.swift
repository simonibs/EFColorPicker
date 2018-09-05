//
//  EFDefaultColors.swift
//  EFColorPicker
//
//  Created by Simon He on 4/9/18.
//

import Foundation
import UIKit

protocol EFDefaultColorsDelegate: class {
    func defaultColorSelected(_ selected: UIColor)
}

class EFDefaultColors: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let cellId = "default_color_cell"
    var colors: [UIColor] = []
    var colorsCollectionView: UICollectionView!
    weak var delegate: EFDefaultColorsDelegate?
    
    public override init() {
        super.init()
        self.setup()
    }
    
    private func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 40, height: 40)
        colorsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        colorsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        colorsCollectionView.backgroundColor = UIColor.white
        colorsCollectionView.delegate = self
        colorsCollectionView.dataSource = self
    }
    
    func setColors(colors: [UIColor]) {
        self.colors = colors
        colorsCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.layer.borderWidth = CGFloat(0.5)
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 5
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.defaultColorSelected(self.colors[indexPath.row])
    }
}
