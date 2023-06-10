//
//  ToDoListView.swift
//  To Do List
//
//  Created by Student21 on 10/06/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItme]
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView{
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            } .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "7yfrF586ZOZLzUgNzGvZXI9d63C3")
    }
}
