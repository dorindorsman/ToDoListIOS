//
//  User.swift
//  To Do List
//
//  Created by Student21 on 10/06/2023.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
