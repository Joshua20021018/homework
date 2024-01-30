//
//  NewitemView.swift
//  studentDoList
//
//  Created by Joshua on 30/1/2024.
//

import SwiftUI

struct Calendar: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Schedule")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", background: .gray) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                        .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("need to fill in all fieds and select deu date that is today or newer."))
            })
        }
    }
}

#Preview {
    Calendar(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
