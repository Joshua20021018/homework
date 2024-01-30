//
//  ToDoListView.swift
//  studentDoList
//
//  Created by Joshua on 30/1/2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
   
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListitemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                print("itemID: ", item.id)
                            
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
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
            .sheet(isPresented: $viewModel.showingNewItemView) {
                Calendar(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View{
        ToDoListView(userId: "OCE3rBEbR7U1mAfupIy58Nav3Du2")
    }
}
