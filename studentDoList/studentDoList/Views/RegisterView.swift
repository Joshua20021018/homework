import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    @State private var registrationComplete = false

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Register", subtitle: "Don't forget the deadline!", angle: -15, backgrand: .yellow)
                Form {
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TLButton(
                        title: "Create Account", background: .green
                    ) {
                        viewModel.register()
                        registrationComplete = true
                    }
                }
                .offset(y: -50)
                Spacer()
            }
            .background(
                NavigationLink(
                    destination: ToDoListView(userId: String()),
                    isActive: $registrationComplete,
                    label: {
                        EmptyView()
                    }
                )
                .hidden()
            )
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
