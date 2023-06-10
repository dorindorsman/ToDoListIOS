//
//  ToDoListItem.swift
//  To Do List
//
//  Created by Student21 on 10/06/2023.
//

import Foundation


struct ToDoListItme: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
