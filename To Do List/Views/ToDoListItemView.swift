//
//  ToDoListItemView.swift
//  To Do List
//
//  Created by Student21 on 10/06/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItme
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ?
                      "checkmark.circle.fill" : "circle" )
                      .foregroundColor(Color.blue)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123",
                                     title: "Get milk",
                                     dueDate: Date().timeIntervalSince1970,
                                     createdDate: Date().timeIntervalSince1970,
                                     isDone: false))
    }
}
