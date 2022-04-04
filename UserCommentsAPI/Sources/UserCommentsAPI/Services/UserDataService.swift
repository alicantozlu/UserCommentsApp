//
//  UserDataService.swift
//  
//
//  Created by Ali Can Tozlu on 3.04.2022.
//

import Foundation
import Alamofire

/*enum UserListError: Error{
 case noDataAvailable
 case canNotProcessData
 }*/

public protocol UserDataProtocol where Self: AnyObject{
    func fetchUserData<T: Decodable>(url:String ,completion: @escaping (Result<[T], Error>) -> Void)
}

public class UserDataService: UserDataProtocol{
    
    public static let service = UserDataService()
    
    public init() {}
    
    public func fetchUserData<T: Decodable>(url:String ,completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url).responseData { response in
            switch response.result{
            case .success(let data):
                do{
                    let decoder = JSONDecoder()
                    let newData = try decoder.decode(T.self, from:data)
                    completion(.success(newData))
                }catch{
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
