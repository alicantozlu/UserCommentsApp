//
//  UserScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import CollectionViewRegister
import UserCommentsAPI

class UserScreen: UIViewController {

    var userListData = [User]()
    let service = UserDataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.fetchUserData(url: "https://jsonplaceholder.typicode.com/users") { (response: Result<[User], Error>) -> Void in
            switch response{
            case .success(let data):
                self.userListData = data
                print("UserList:",data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
