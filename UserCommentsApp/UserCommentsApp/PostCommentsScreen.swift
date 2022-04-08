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
    @IBOutlet var backButton: UIButton!
    
    var postCommentsScreenVM: postCommentsScreenViewModelProtocol!{
        didSet{
            postCommentsScreenVM.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backButton.isHidden = false
        //backButton.backgroundColor = .clear
        backButton.layer.cornerRadius = 30
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.black.cgColor
        
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
        return CGSize(width: view.frame.width, height: view.frame.width/4)
    }
}
