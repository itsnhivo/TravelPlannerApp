//
// Profile.swift
// TravelPlannerApp
//
// Created by Placidia Ong on 7/29/25.
//
import SwiftUI

import SwiftUI

struct ProfileView: View {
  @StateObject var userData = UserData(username: "User123", password: "password", email: "user@example.com")

  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        ZStack {
          Circle()
            .frame(width: 150)
            .foregroundColor(.appTeal)
            .shadow(radius: 5)
          Image(systemName: "person.crop.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 140)
            .foregroundColor(.appLightBlue)
        }

        VStack(spacing: 15) {
          VStack(alignment: .leading, spacing: 4) {
            Text("Username")
              .font(.caption)
              .foregroundColor(.gray)
            Text(userData.username)
              .font(.title2)
              .fontWeight(.semibold)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
              .background(Color.appCream)
              .cornerRadius(12)
              .shadow(color: .black.opacity(0.1), radius: 3)
          }

          VStack(alignment: .leading, spacing: 4) {
            Text("Email")
              .font(.caption)
              .foregroundColor(.gray)
            Text(userData.email)
              .font(.title2)
              .fontWeight(.semibold)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
              .background(Color.appCream)
              .cornerRadius(12)
              .shadow(color: .black.opacity(0.1), radius: 3)
          }
        }
        .padding(.horizontal)

        Spacer()

        VStack(spacing: 15) {
          NavigationLink(destination: EditedProfileView(userData: userData)) {
            Text("Edit Profile")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.appBlue)
              .foregroundColor(.white)
              .cornerRadius(15)
              .shadow(color: .black.opacity(0.2), radius: 5)
          }

          NavigationLink(destination: DeleteAccountView()) {
            Text("Delete Account")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.appRed)
              .foregroundColor(.white)
              .cornerRadius(15)
              .shadow(color: .black.opacity(0.2), radius: 5)
          }
        }
        .padding(.horizontal)
      }
      .padding(.vertical, 50)
      .navigationTitle("Profile")
      .navigationBarHidden(true)
      .background(Color.appLightBlue.ignoresSafeArea())
    }
  }
}

#Preview {
  ProfileView()
}
