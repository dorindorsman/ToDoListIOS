//
//  ToDoListItemViewViewModel.swift
//  To Do List
//
//  Created by Student21 on 10/06/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init(){}
    
    func toggleIsDone(item: ToDoListItme) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
