//
//  UserComments.swift
//  
//
//  Created by Ali Can Tozlu on 3.04.2022.
//

import Foundation

public struct UserComment: Decodable{
    public let postId: Int?
    public let id: Int?
    public let name: String?
    public let email: String?
    public let body: String?
}
