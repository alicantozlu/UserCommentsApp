//
//  File.swift
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

public protocol UserListProtocol{
    func fetchUserList<T: Decodable>(url:String ,completion: @escaping (Result<[T], Error>) -> Void)
}

public class UserListService: UserListProtocol{
    public init() {}
    
    //T yerine geriye dondurulmesi istenilen bilgilerin dizi modeli gonderilecek
    // public func fetchUserList<T: Decodable>(url:String ,completion: @escaping (Result<[T], UserListError>) -> Void) {
    public func fetchUserList<T: Decodable>(url:String ,completion: @escaping (Result<[T], Error>) -> Void) {
        AF.request(url).responseData { [weak self] response in
            switch response.result{
            case .success(let data):
                do{
                    let decoder = JSONDecoder()
                    let newData = try decoder.decode(T.self, from:data)
                    completion(.success(newData))
                }catch{
                    completion(.failure(error.localizedDescription))
                }
            case .failure(let error):
                completion(.failure(error.localizedDescription))
            }
        }
    }
}
