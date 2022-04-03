//
//  UserPosts.swift
//  
//
//  Created by Ali Can Tozlu on 3.04.2022.
//

import Foundation

struct UserPost: Decodable{
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}

