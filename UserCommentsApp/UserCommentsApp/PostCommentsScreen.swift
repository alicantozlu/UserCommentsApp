//
//  PostCommentsScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import CollectionViewRegister
import UserCommentsAPI

class PostCommentsScreen: UIViewController {
    
    @IBOutlet var commentCollectionView: UICollectionView!
    private var userCommentsData = [UserComment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentCollectionView.register(cellType: ReusableCollectionViewCell.self)
        
        fetchUserComments()
    }
}

extension PostCommentsScreen{
    fileprivate func fetchUserComments(){
        UserDataService.service.fetchUserData(url: "https://jsonplaceholder.typicode.com/comments") { (response: Result<[UserComment], Error>) -> Void in
            switch response{
            case .success(let data):
                self.userCommentsData = data
                self.commentCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension PostCommentsScreen: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userCommentsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: ReusableCollectionViewCell.self, indexPath: indexPath)
        let comment = self.userCommentsData[indexPath.row]
        cell.configUserComments(model: comment)
        return cell
    }
}

extension PostCommentsScreen: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width/3)
    }
}
