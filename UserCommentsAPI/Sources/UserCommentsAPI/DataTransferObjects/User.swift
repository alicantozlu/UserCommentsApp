//
//  User.swift
//  
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import Foundation

public struct User: Decodable{
    public let id: Int?
    public let name: String?
    public let username: String?
    public let email: String?
    public let address: Address?
    public let phone: String?
    public let website: String?
    public let company: Company?
}

public struct Address: Decodable{
    public let street: String?
    public let suite: String?
    public let city: String?
    public let zipcode: String?
    public let geo: Geo?
}

public struct Geo: Decodable{
    public let lat: String?
    public let lng: String?
}

public struct Company: Decodable{
    public let name: String?
    public let catchPhrase: String?
    public let bs: String?
}
