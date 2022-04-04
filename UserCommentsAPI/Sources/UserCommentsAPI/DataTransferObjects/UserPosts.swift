//
//  UserPosts.swift
//  
//
//  Created by Ali Can Tozlu on 3.04.2022.
//

import Foundation

public struct UserPost: Decodable{
    public let userId: Int?
    public let id: Int?
    public let title: String?
    public let body: String?
}

