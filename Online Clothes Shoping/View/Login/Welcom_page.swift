//
//  Welcom_page.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct Welcom_page: View {
    var body: some View {
        ZStack{
            Image("welcome")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                
                Text( "Happy Shopping")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .bold()
                    .font(Font.custom("Lora", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing], -1.0/*@END_MENU_TOKEN@*/)
                
                
                Text( "it's time \n to expirience over thousands of stylish producta ib Genteel")
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding([.leading, .bottom, .trailing], 16.0)
                
                
                NavigationLink {
                    SignInView()
                } label: {
                    RoundButton(title: "Get Started") {
                    }
                    
                }
                .padding(.bottom, 50.0)
                .frame(width: 360.0, height: 100.0)
                
            }
            .padding(.top, 7.0)
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        
    }
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            
            NavigationView {
                Welcom_page()
            }
            
        }
    }
}
