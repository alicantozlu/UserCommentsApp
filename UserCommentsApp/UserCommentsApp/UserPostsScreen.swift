//
//  UserPostsScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import CollectionViewRegister
import UserCommentsAPI
import SwiftHelperFunctions

class UserPostsScreen: UIViewController {
    
    @IBOutlet var postCollectionView: UICollectionView!
    private var userPostsData = [UserPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postCollectionView.register(cellType: ReusableCollectionViewCell.self)
        fetchUserPosts()
        print(userPostsData)
    }
}

extension UserPostsScreen: LoadingShowable{
    fileprivate func fetchUserPosts(){
        UserDataService.service.fetchUserData(url: "https://jsonplaceholder.typicode.com/posts") {
            [weak self] (response: Result<[UserPost], Error>) -> Void in
            guard let self = self else { return }
            switch response{
            case .success(let data):
                self.userPostsData = data
                self.postCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension UserPostsScreen: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPostsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: ReusableCollectionViewCell.self, indexPath: indexPath)
        let post = self.userPostsData[indexPath.row]
        cell.configUserPosts(model: post)
        return cell
    }
}

extension UserPostsScreen: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        SwiftHelper.helper.screenPresenter(self, "postCommentsScreenIdentifier", .fullScreen, .flipHorizontal, "UserCommentsScreen'e Geçildi")
    }
}

extension UserPostsScreen: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width/4)
    }
}
