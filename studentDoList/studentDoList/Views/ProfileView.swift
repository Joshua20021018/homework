//
//  ProfileView.swift
//  studentDoList
//
//  Created by Joshua on 30/1/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 125, height: 125)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name:")
                        Text("joshua")
                    }
                    HStack {
                        Text("Email:")
                        Text("kashun18@gmail.com")
                    }
                }
              
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
