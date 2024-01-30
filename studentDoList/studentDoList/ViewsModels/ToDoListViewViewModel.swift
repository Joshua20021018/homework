//
//  ToDoListViewViewModel.swift
//  studentDoList
//
//  Created by Joshua on 30/1/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    func delete(id:String) {
        let db = Firestore.firestore()
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        print ("uId", uId)
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
