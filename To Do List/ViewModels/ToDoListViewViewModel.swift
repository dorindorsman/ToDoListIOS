//
//  ToDoListViewViewModel.swift
//  To Do List
//
//  Created by Student21 on 10/06/2023.
//
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    //Delete to do list item 
    /// - Parameter id : Item id delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
