//
//  Delete.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/30/25.
//

import SwiftUI

struct Delete: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Are you sure you want to delete your account and lose all your rewards?")
                    .font(.title)
                    .fontWeight(.regular)
                    .padding(.all, 40.0)
                NavigationLink(destination: SignUp()) {
                    Text("Delete Account")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    Delete()
}
