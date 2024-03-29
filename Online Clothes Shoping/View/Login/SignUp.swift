//
//  Register.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    var body: some View {
        ZStack {
            
            Image("welcome")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                
                Text( "Happy Shopping")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .bold()
                    .font(Font.custom("Lora", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing], 10.0/*@END_MENU_TOKEN@*/)
                
                
                Text( "it's time \n to expirience over thousands of stylish producta ib Genteel")
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding([.leading, .bottom, .trailing], 16.0)
                
                
               
                LineTextField(title: "",placholder: "Enter your email address", txt: $viewModel.email)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                
                LineTextField(title: "",placholder: "Enter your Phone Number", txt: $viewModel.phoneNumber)
                    
                
                LineTextField(title: "",placholder: "Enter your ConformPassword", txt: $viewModel.email)
                   // .textFieldStyle(RoundedBorderTextFieldStyle())
                
                LineTextField(title: "",placholder: "Enter your Phone Number", txt: $viewModel.phoneNumber)
                   // .textFieldStyle(RoundedBorderTextFieldStyle())
                
               
                
                NavigationLink {
                    Home_page()
                } label: {
                    RoundButton(title: "Home_page") {
                    }
                }
                .padding(.top, 40.0)
                
                Text("OR")
                    .foregroundStyle(Color(.gray))
                
                HStack{
                    Image("SignUp")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 90, height: 90)
                    
                    Image("SignUp")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 90, height: 90)
                    
                    Image("SignUp")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 90, height: 90)
                }
                }
                
                Button(action: {
                    Home_page()
                }) {
                    Text("Register")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                
                .padding()
               
                switch viewModel.registrationStatus {
                case .loading:
                    ProgressView()
                case .success:
                    Text("Registration successful!")
                case .failure(let errorMessage):
                    Text(errorMessage)
                        .foregroundColor(.red)
                default:
                    EmptyView()
                }
            }
        
            
            
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            
        }
    
        
       
        
  
    
}
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            
            NavigationView {
                SignInView()
            }
            
        }
    }

