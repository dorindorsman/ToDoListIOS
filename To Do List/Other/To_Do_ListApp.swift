//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Student18 on 10/06/2023.
//

import FirebaseCore
import SwiftUI

@main
struct To_Do_ListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
            //
        }
    }
}
