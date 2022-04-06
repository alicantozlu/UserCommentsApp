//
//  UserScreenViewModel.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 6.04.2022.
//

import Foundation
import UserCommentsAPI

protocol UserScreenViewModelProtocol:AnyObject{
    var delegate: UserScreenViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    //func setCellSize() -> (width: Double, height: Double)
    func fetchData()
    func getDataIndex(index: Int) -> User?
}

protocol UserScreenViewModelDelegate: AnyObject{
    func showLoadingView()
    func hideLoadingView()
    func reloadData()
}




final class UserScreenViewModel{
    private var userListData = [User]()
    weak var delegate: UserScreenViewModelDelegate?
    
    let service: UserDataProtocol
    init(service: UserDataProtocol){
        self.service = service
    }
}

extension UserScreenViewModel: UserScreenViewModelProtocol{
    var numberOfItems: Int {
        return userListData.count
    }
    
    /*func setCellSize() -> (width: Double, height: Double) {
        
    }*/
    
    func fetchData() {
        fetchUserList()
    }
    
    func getDataIndex(index: Int) -> User? {
        userListData[index]
    }
}



extension UserScreenViewModel{
    fileprivate func fetchUserList(){
        //showLoading()
        self.delegate?.showLoadingView()
        UserDataService.service.fetchUserData(url: "https://jsonplaceholder.typicode.com/users") {
            [weak self] (response: Result<[User], Error>) -> Void in
            guard let self = self else { return }
            //self.hideLoading()
            self.delegate?.hideLoadingView()
            switch response{
            case .success(let data):
                self.userListData = data
                //self.userCollectionView.reloadData()
                self.delegate?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
