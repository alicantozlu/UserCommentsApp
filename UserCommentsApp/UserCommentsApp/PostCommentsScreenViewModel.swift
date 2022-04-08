//
//  PostCommentsScreenViewModel.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 7.04.2022.
//

import Foundation
import UserCommentsAPI

protocol postCommentsScreenViewModelProtocol:AnyObject{
    var delegate: postCommentsScreenViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    //func setCellSize() -> (width: Double, height: Double)
    func fetchData()
    func getDataIndex(index: Int) -> UserComment?
}

protocol postCommentsScreenViewModelDelegate: AnyObject{
    func showLoadingView()
    func hideLoadingView()
    func reloadData()
}

final class PostCommentsScreenViewModel{
    private var userCommentsData = [UserComment]()
    
    var delegate: postCommentsScreenViewModelDelegate?
    
    let service: UserDataProtocol?
    init(service: UserDataService){
        self.service = service
    }
}

extension PostCommentsScreenViewModel: postCommentsScreenViewModelProtocol{
    var numberOfItems: Int {
        userCommentsData.count
    }
    
    func fetchData() {
        fetchUserComments()
    }
    
    func getDataIndex(index: Int) -> UserComment? {
        userCommentsData[index]
    }
}

extension PostCommentsScreenViewModel{
    fileprivate func fetchUserComments(){
        
        self.delegate?.showLoadingView()
        
        UserDataService.service.fetchUserData(url: "https://jsonplaceholder.typicode.com/comments") {
            [weak self] (response: Result<[UserComment], Error>) -> Void in
            guard let self = self else { return }
            
            self.delegate?.hideLoadingView()
            
            switch response{
            case .success(let data):
                self.userCommentsData = data
                
                self.delegate?.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
