//
//  Profile.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/29/25.
//
import SwiftUI

struct Profile: View {
    @ObservedObject var userData: UserData
    var body: some View {
        NavigationStack {
            VStack {
               ZStack {
                   Circle()
                       .frame(width: 300.0)
                   Circle()
                       .frame(width: 280.0)
                       .foregroundColor(Color(hue: 0.0, saturation: 0.1, brightness: 1.0))
               }
               .offset(y:-30)
                Spacer().frame(height: 10)
               VStack {
                   Text("\(userData.username)")
                       .padding(.horizontal, 150)
                       .padding(.vertical, 15)
                       .background(RoundedRectangle(cornerRadius: 8)
                               .fill(Color.gray.opacity(0.2)))
                       .overlay(RoundedRectangle(cornerRadius: 8)
                           .stroke(Color.gray, lineWidth: 1))
                   Spacer().frame(height: 30)
                   Text("\(userData.password)")
                       .padding(.horizontal, 150)
                       .padding(.vertical, 15)
                       .background(RoundedRectangle(cornerRadius: 8)
                               .fill(Color.gray.opacity(0.2)))
                       .overlay(RoundedRectangle(cornerRadius: 8)
                           .stroke(Color.gray, lineWidth: 1))
                   Spacer().frame(height: 30)
                   NavigationLink(destination: EditedProfile(originalUsername: "", originalPassword: "", username: "", password: "", email: "")) {
                       Text("Edit")
                           .fontWeight(.bold)
                           .foregroundColor(.blue)
                   }
                   Spacer().frame(height: 100)
                   NavigationLink(destination: Delete()) {
                       Text("Delete Account")
                           .fontWeight(.bold)
                           .foregroundColor(.red)
                   }
               }
               .offset(y:20)
           }
           .padding(.all, 50.0)
        }
    }
}

#Preview {
    Profile (userData: UserData(username: "", password: ""))
}
