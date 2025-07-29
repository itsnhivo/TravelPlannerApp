//
//  Password:Login page.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/29/25.
//

import SwiftUI

struct Password_Login_page: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            Circle()
                .frame(width:300)
                .foregroundColor(Color(hue: 0.414, saturation: 0.375, brightness: 0.911))
                .offset(y:-60)
            TextField("Enter username here...", text: $username )
                .padding()
                .background(Color(hue: 0.534, saturation: 0.161, brightness: 0.973))
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1))
                .cornerRadius(25)
                .offset(y:-40)
            TextField("Enter password here...", text: $password )
                .padding()
                .background(Color(hue: 0.534, saturation: 0.161, brightness: 0.973))
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1))
                .cornerRadius(25)
                .offset(y:-40)
            Button {
                
            } label: {
                Text("Login")
                    .fontWeight(.bold)
                    .offset(y:100)
            }
            .padding()
        }
        .padding(.all, 35.0)
    }
}

#Preview {
    Password_Login_page()
}
