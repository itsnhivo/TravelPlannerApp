//
// Delete.swift
// TravelPlannerApp
//
// Created by Placidia Ong on 7/30/25.
//

import SwiftUI

struct DeleteAccountView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    VStack(spacing: 30) {
      Spacer()

      Image(systemName: "exclamationmark.triangle.fill")
        .font(.system(size: 80))
        .foregroundColor(.appRed)

      Text("Are you sure you want to delete your account?")
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(.appDarkBlue)
        .multilineTextAlignment(.center)
        .padding(.horizontal)

      Text("This action cannot be undone. You will lose all your trips, journals, and rewards.")
        .font(.body)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .padding(.horizontal)

      Button(action: {
        // TODO: Add logic to delete the account
        print("Account deletion requested.")
        dismiss() // Close this view after action
      }) {
        Text("Delete Account")
          .fontWeight(.bold)
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color.appRed)
          .foregroundColor(.white)
          .cornerRadius(15)
          .shadow(color: .black.opacity(0.2), radius: 5)
      }
       
      Button("Cancel") {
        dismiss()
      }
      .fontWeight(.semibold)
      .foregroundColor(.appBlue)

      Spacer()
    }
    .padding(.horizontal, 40)
    .background(Color.appLightBlue.ignoresSafeArea())
  }
}

#Preview {
  DeleteAccountView()
}
