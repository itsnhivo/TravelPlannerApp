//
//  SignUp.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/30/25.
//

import SwiftUI

struct SignUp: View {
    @State private var inputUsername: String = ""
    @State private var inputPassword: String = ""
    @State private var isLoggedIn = false
    
    @StateObject var userData = UserData()

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()

                ZStack {
                    Circle()
                        .frame(width: 300)
                        .foregroundColor(.appTeal)
                        .shadow(radius: 5)
                    
                    Image("Trailbliss")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 250)
                }

                VStack(spacing: 20) {
                    TextField("Enter username here...", text: $inputUsername)
                        .padding()
                        .background(Color.appCream)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.appBlue, lineWidth: 2))
                        .cornerRadius(12)
                    
                    SecureField("Enter password here...", text: $inputPassword)
                        .padding()
                        .background(Color.appCream)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.appBlue, lineWidth: 2))
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Button {
                    userData.username = inputUsername
                    userData.password = inputPassword
                    isLoggedIn = true
                } label: {
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 60)
                        .background(Color.appRed)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.2), radius: 5)
                }
                .navigationDestination(isPresented: $isLoggedIn) {
                    TripsView()
                }

                Spacer()
            }
            .padding(.vertical, 50)
            .navigationBarHidden(true)
            .background(Color.appLightBlue.ignoresSafeArea())
        }
    }
}

#Preview {
    SignUp()
}
