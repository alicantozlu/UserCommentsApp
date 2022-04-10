//
//  UserPostsScreenViewModel.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 7.04.2022.
//

import Foundation
import UserCommentsAPI

protocol UserPostsScreenViewModelProtocol:AnyObject{
    var delegate: UserPostsScreenViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    //func setCellSize() -> (width: Double, height: Double)
    func fetchData()
    func getDataIndex(index: Int) -> UserPost?
}

protocol UserPostsScreenViewModelDelegate: AnyObject{
    func showLoadingView()
    func hideLoadingView()
    func reloadData()
}

final class UserPostsScreenViewModel{
    private var userPostsData = [UserPost]()
    
    weak var delegate: UserPostsScreenViewModelDelegate?
    
    let service: UserDataProtocol
    init(service: UserDataProtocol){
        self.service = service
    }
}

extension UserPostsScreenViewModel: UserPostsScreenViewModelProtocol{
    func getDataIndex(index: Int) -> UserPost? {
        userPostsData[index]
    }
    
    var numberOfItems: Int {
        return userPostsData.count
    }
    
    func fetchData() {
        fetchUserPosts()
    }
}

extension UserPostsScreenViewModel{
    fileprivate func fetchUserPosts(){

        self.delegate?.showLoadingView()

        UserDataService.service.fetchUserData(url: "https://jsonplaceholder.typicode.com/users/\(UserPostsScreen.userId)/posts") {
            [weak self] (response: Result<[UserPost], Error>) -> Void in
            guard let self = self else { return }

            self.delegate?.hideLoadingView()
            
            switch response{
            case .success(let data):
                self.userPostsData = data
 
                self.delegate?.reloadData()
   
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
