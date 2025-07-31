//
//  Profile.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/29/25.
//

import SwiftUI

import SwiftUI

struct EditedProfileView: View {
    @StateObject var userData: UserData
    @State private var newUsername: String
    @State private var newPassword: String
    @State private var newEmail: String
    
    @Environment(\.dismiss) var dismiss

    init(userData: UserData) {
        _userData = StateObject(wrappedValue: userData)
        _newUsername = State(initialValue: userData.username)
        _newPassword = State(initialValue: userData.password)
        _newEmail = State(initialValue: userData.email)
    }

    var body: some View {
        VStack(spacing: 25) {
            Text("Edit Your Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.appDarkBlue)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Username", text: $newUsername)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.appCream)
                    .cornerRadius(12)

                SecureField("Password", text: $newPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.appCream)
                    .cornerRadius(12)

                TextField("Email", text: $newEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.appCream)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Button("Save Changes") {
                userData.username = newUsername
                userData.password = newPassword
                userData.email = newEmail
                dismiss()
            }
            .disabled(!hasChanges)
            .padding()
            .frame(maxWidth: .infinity)
            .background(hasChanges ? Color.appBlue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(.horizontal)
            .shadow(color: .black.opacity(0.2), radius: 5)

            Spacer()
        }
        .padding(.vertical, 50)
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.appLightBlue.ignoresSafeArea())
    }

    var hasChanges: Bool {
        newUsername != userData.username ||
        newPassword != userData.password ||
        newEmail != userData.email
    }
}

#Preview {
    EditedProfileView(userData: UserData(username: "user123", password: "password", email: "user@example.com"))
}
