//
//  UICollectionView+Extension.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 3.04.2022.
//

import UIKit

extension UICollectionView{
    
    func register(cellType: UICollectionViewCell.Type){
        register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
    }
    
    func dequeCell<T: UICollectionViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError("CollectionView Cell Olusturulurken Hata Olustu")
        }
        return cell
    }
}
