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
        VStack {
            TextField("EntEmail", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModel.login { token in
                    if let token = token {
                        UserDefaults.standard.set(token, forKey: "token")
                        isLogged = true
                    }
                }
            }) {
                Text("Login")
                    .frame(width: 370 , height: 50)
                    .background( Color.green)
                    .cornerRadius(20)
                    .foregroundColor(.black)
                Spacer()
            }
            .disabled(viewModel.isLoading || viewModel.email.isEmpty || viewModel.password.isEmpty)
            .padding()
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            Text(viewModel.errorMessage)
                .foregroundColor(.red)
                .padding()
        }
        .sheet(isPresented: $isLogged) {
            Home_page()
        }
        
    }
}

#Preview {
    LoginView()
}
