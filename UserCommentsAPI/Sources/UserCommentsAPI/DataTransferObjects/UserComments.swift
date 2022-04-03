//
//  UserComments.swift
//  
//
//  Created by Ali Can Tozlu on 3.04.2022.
//

import Foundation

struct UserComment: Decodable{
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}
