//
//  RegisterViewViewModel.swift
//  To Do List
//
//  Created by Student21 on 10/06/2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    
    
    init(){
        
    }
    
    
    func register(){
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecoed(id: userId)
        }
    }
    
    private func insertUserRecoed(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty,
              !email.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty,
              !password.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        guard password.count >= 6 else {
            return false
        }
       return true
    }
    
}
