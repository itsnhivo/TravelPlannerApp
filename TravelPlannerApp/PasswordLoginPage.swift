//
//  Password:Login page.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/29/25.
//

import SwiftUI

struct PasswordLoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Welcome Back!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.appDarkBlue)
                .padding(.bottom, 40)
            TextField("Enter username here...", text: $username )
                .padding()
                .background(Color.appCream)
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.appBlue, lineWidth: 2))
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom, 20)
            SecureField("Enter password here...", text: $password )
                .padding()
                .background(Color.appCream)
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.appBlue, lineWidth: 2))
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom, 40)
            
            Button {
                print("Attempting to log in with username: \(username)")
            } label: {
                Text("Login")
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 60)
                    .background(Color.appRed)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y:5)
            }
            Spacer()
        }
        .padding(.vertical, 50)
    }
}

#Preview {
    PasswordLoginPage()
}
