//
//  Profile.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/29/25.
//

import SwiftUI

struct EditedProfile: View {
    @State var originalUsername: String
    @State var originalPassword: String
    @State var username: String
    @State var password: String
    @State var email: String
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 300.0)
                Circle()
                    .frame(width: 280.0)
                    .foregroundColor(Color(hue: 0.0, saturation: 0.1, brightness: 1.0))
            }
            .offset(y:-20)
            Spacer()
            VStack {
                TextField("Username", text: $username)
                Spacer().frame(height: 30)
                SecureField("Password", text: $password)
                Spacer().frame(height: 30)
            }
            .offset(y:-100)
            VStack {
                
                if hasChanges {
                    NavigationLink (destination: Profile(userData: UserData(username: "", password: ""))) {
                        Text ("Save Changes")
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .padding(.all, 50.0)
    }
    var hasChanges: Bool {
            username != originalUsername || password != originalPassword
        }

        func saveChanges() {
            // Save logic here (e.g. send to server)
            originalUsername = username
            originalPassword = password
            print("Changes saved")
        }
}

#Preview {
    EditedProfile(originalUsername: "", originalPassword: "", username: "", password: "", email: "")
}
