//
//  UserPostsScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import SwiftHelpers

class UserPostsScreen: UIViewController {
    
    @IBOutlet var postCollectionView: UICollectionView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var backButtonBlur: UIVisualEffectView!
    
    var userPostsScreenVM: UserPostsScreenViewModelProtocol!{
        didSet{
            userPostsScreenVM.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        backButton.isHidden = false
        backButtonBlur.cornerConfigure(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner], borderColor: UIColor.white.cgColor, borderWidth: 1)
        
        postCollectionView.register(cellType: ReusableCollectionViewCell.self)
        userPostsScreenVM.fetchData()
    }
}

extension UserPostsScreen{
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension UserPostsScreen: UserPostsScreenViewModelDelegate, LoadingShowable{
    func showLoadingView() {
        //showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func reloadData() {
        postCollectionView.reloadData()
    }
}

extension UserPostsScreen: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPostsScreenVM.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: ReusableCollectionViewCell.self, indexPath: indexPath)
        if let post = userPostsScreenVM.getDataIndex(index: indexPath.row){
            cell.configUserPosts(model: post)
        }
        return cell
    }
}

extension UserPostsScreen: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let postDetailScreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postDetailScreenIdentifier") as! PostDetailScreen
        postDetailScreenVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        postDetailScreenVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        PostDetailScreen.titleText = userPostsScreenVM.getDataIndex(index: indexPath.row)?.title ?? "Post Title"
        PostDetailScreen.titleText = userPostsScreenVM.getDataIndex(index: indexPath.row)?.body ?? "Post Body"
        
        self.present(postDetailScreenVC, animated: true, completion: {print("PostDetailsScreen Açıldı")})

    }
}

extension UserPostsScreen: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width/4)
    }
}


