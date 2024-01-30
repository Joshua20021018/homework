//
//  LoginViewViewModel.swift
//  studentDoList
//
//  Created by Joshua on 30/1/2024.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "this cannot be blank!"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Plese enter valid email!"
            return false
        }
        return true
    }
}
