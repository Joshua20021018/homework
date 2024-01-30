//
//  User.swift
//  studentDoList
//
//  Created by Joshua on 30/1/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
