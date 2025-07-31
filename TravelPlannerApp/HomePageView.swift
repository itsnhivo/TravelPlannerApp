//
//  HomePageView.swift
//  TravelPlannerApp
//
//  Created by Scholar on 7/31/25.
//

import SwiftUI

struct Destination: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}

struct HomePageView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HomePageView()
}
