//
//  SignUp.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/30/25.
//

import SwiftUI
//import Combine

struct SignUp: View {
    @State private var inputUsername: String = ""
    @State private var inputPassword: String = ""
    @State private var isLoggedIn = false
    
    @StateObject var userData = UserData(username: "", password: "")
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Circle()
                        .frame(width:300)
                        .foregroundColor(Color(hue: 1.1, saturation: 0.375, brightness: 0.911))
                    Image("Trailbliss")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width:350)
                }
                .offset(y:-60)
                TextField("Enter username here...", text: $inputUsername )
                    .padding()
                    .background(Color(hue: 1.1, saturation: 0.161, brightness: 0.973))
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1))
                    .cornerRadius(25)
                    .offset(y:-20)
                TextField("Enter password here...", text: $inputPassword )
                    .padding()
                    .background(Color(hue: 1.1, saturation: 0.161, brightness: 0.973))
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1))
                    .cornerRadius(25)
                    .offset(y:-20)
                Button("Login") {
                    userData.username = inputUsername
                    userData.password = inputPassword
                    isLoggedIn = true
                }
                .padding()
                .navigationDestination(isPresented: $isLoggedIn) {
                    trip1view()
                }
            }
            .padding(.all, 35.0)
        }
    }
}

#Preview {
    SignUp()
}
