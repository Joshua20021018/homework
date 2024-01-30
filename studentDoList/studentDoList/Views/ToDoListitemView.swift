//
//  ToDoListitemView.swift
//  studentDoList
//
//  Created by Joshua on 30/1/2024.
//

import SwiftUI

struct ToDoListitemView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueData).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
           
        }
    }
}

struct ToDoListitemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListitemView(item: .init(
            id:"999",
            title:"go",
            dueData: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        ))
    }
}
