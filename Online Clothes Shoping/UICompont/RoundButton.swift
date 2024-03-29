//
//  RoundButton.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Tittle"
    var didTap: (()->())?
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
        .frame(width: 370 , height: 50)
        .background( Color.green)
        .cornerRadius(20)
        Spacer()
        
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}
