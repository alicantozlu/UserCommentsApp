//
//  PostCommentsScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import SwiftHelpers

class PostCommentsScreen: UIViewController {
    
    @IBOutlet var commentCollectionView: UICollectionView!
    
    @IBOutlet var backButtonContainerView: UIView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var backButtonBlur: UIVisualEffectView!
    
    var postCommentsScreenVM: postCommentsScreenViewModelProtocol!{
        didSet{
            postCommentsScreenVM.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.frame.height/4, right: 0)
        
        backButtonContainerView.backgroundColor = .clear

        backButton.isHidden = false
        backButtonBlur.cornerConfigure(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner], borderColor: UIColor.white.cgColor, borderWidth: 1)
        
        commentCollectionView.register(cellType: ReusableCollectionViewCell.self)
        postCommentsScreenVM.fetchData()
    }
}

extension PostCommentsScreen{
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension PostCommentsScreen: postCommentsScreenViewModelDelegate, LoadingShowable{
    func showLoadingView() {
        //showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func reloadData() {
        commentCollectionView.reloadData()
    }
}


extension PostCommentsScreen: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postCommentsScreenVM.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: ReusableCollectionViewCell.self, indexPath: indexPath)
        if let comment = postCommentsScreenVM.getDataIndex(index: indexPath.row){
            cell.configUserComments(model: comment)
        }
        return cell
    }
}

extension PostCommentsScreen: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height/3)
    }
}
