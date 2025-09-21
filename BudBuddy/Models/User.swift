//
//  User.swift
//  BudBuddy
//
//  Created by Matteo Cola on 15.09.2025.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String                 // <-- backend now sends 'id'
    let username: String
    let email: String?
    var friends: [String]?
    var friendRequests: [String]?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username
        case email
        case friends
        case friendRequests
    }
}
struct AuthResponse: Codable {
    let user: User
    let token: String
}


//search looking for _id, login looking for id, fix sum
