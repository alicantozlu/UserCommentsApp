//
//  UserScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import CollectionViewRegister
import UserCommentsAPI
import SwiftHelperFunctions

class UserScreen: UIViewController {
    
    @IBOutlet var userCollectionView: UICollectionView!
    private var userListData = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userCollectionView.register(cellType: ReusableCollectionViewCell.self)
        fetchUserList()
    }
}

extension UserScreen: LoadingShowable{
    fileprivate func fetchUserList(){
        
        UserDataService.service.fetchUserData(url: "https://jsonplaceholder.typicode.com/users") {
            [weak self] (response: Result<[User], Error>) -> Void in
            guard let self = self else { return }
            switch response{
            case .success(let data):
                self.userListData = data
                self.userCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension UserScreen: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: ReusableCollectionViewCell.self, indexPath: indexPath)
        let user = self.userListData[indexPath.row]
        cell.configUsers(model: user)
        return cell
    }
}

extension UserScreen: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        SwiftHelper.helper.screenPresenter(self, "userPostsScreenIdentifier", .fullScreen, .flipHorizontal, "UserPostsScreen'e Geçildi")
    }
}

extension UserScreen: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height/5)
    }
}
