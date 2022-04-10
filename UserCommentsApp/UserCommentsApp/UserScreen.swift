//
//  UserScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import UserCommentsAPI
import SwiftHelpers

class UserScreen: UIViewController {
    
    @IBOutlet var userCollectionView: UICollectionView!
    
    var userScreenVM: UserScreenViewModelProtocol!{
        didSet{
            userScreenVM.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.frame.height/4, right: 0)
        
        userCollectionView.register(cellType: ReusableCollectionViewCell.self)
        userScreenVM.fetchData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

extension UserScreen: UserScreenViewModelDelegate, LoadingShowable{
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func reloadData() {
        userCollectionView.reloadData()
    }
}

extension UserScreen: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userScreenVM.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: ReusableCollectionViewCell.self, indexPath: indexPath)
        if let user = userScreenVM.getDataIndex(index: indexPath.row){
            cell.configUsers(model: user)
        }
        return cell
    }
}

extension UserScreen: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        UserPostsScreen.userId = userScreenVM.getDataIndex(index: indexPath.row)?.id ?? 0
        UserPostsScreen.titleText = userScreenVM.getDataIndex(index: indexPath.row)?.name ?? ""
        
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "userPostsScreenIdentifier") as! UserPostsScreen
        VC.modalPresentationStyle = .fullScreen
        VC.modalTransitionStyle = .flipHorizontal
        
        let viewModel = UserPostsScreenViewModel(service: UserDataService())
        VC.userPostsScreenVM = viewModel
        
        self.present(VC, animated: true, completion: {print("UserPostsScreen'e Geçildi")})
        
    }
}

extension UserScreen: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height/4)
    }
}
