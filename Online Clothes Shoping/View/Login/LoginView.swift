//
//  LoginView.swift
//  Online Clothes Shoping
//
//  Created by Dilisha priyashan on 2024-03-28.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State private var isLogged = false

    var body: some View {
        ZStack {
            Image("SignUp") // Set your background image here
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(maxWidth: 300) // Adjust the maximum width of the text field

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(maxWidth: 300) // Adjust the maximum width of the text field

                HStack {
                    Spacer()
                    Text("Forgot Password?")
                        .foregroundColor(.green)
                        .padding()
                }

                Button(action: {
                    viewModel.login { token in
                        if let token = token {
                            UserDefaults.standard.set(token, forKey: "token")
                            isLogged = true
                        }
                    }
                }) {
                    Text("Login")
                        .frame(width: 200, height: 50) // Adjust width and height as needed
                        .background(Color.green)
                        .cornerRadius(20)
                        .foregroundColor(.black)
                }
                .disabled(viewModel.isLoading || viewModel.email.isEmpty || viewModel.password.isEmpty)
                .padding()
                .frame(maxWidth: .infinity) // Expand button to fill horizontal space

                if viewModel.isLoading {
                    ProgressView()
                }

                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
                
                Spacer()
            }
        }
        .sheet(isPresented: $isLogged) {
            Home_page()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
