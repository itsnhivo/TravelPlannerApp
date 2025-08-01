//
// ContentView.swift
// TravelPlannerApp
//
// Created by Scholar on 7/28/25.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTab: TabSelection = .home
  @StateObject private var tripStore = TripStore.shared

  var body: some View {
    ZStack {
      VStack {
        switch selectedTab {
        case .home:
          TripsView()
        case .rewards:
          RewardsView()
        case .journals:
          JournalsView()
        case .profile:
          ProfileView()
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.appLightBlue.ignoresSafeArea(.all, edges: .top))

      VStack {
        Spacer()
        BottomToolbarView(selectedTab: $selectedTab)
      }
    }
  }
}

struct BottomToolbarView: View {
  @Binding var selectedTab: TabSelection

  var body: some View {
    HStack {
      Spacer()
      Button(action: { selectedTab = .home }) {
        ToolbarItemView(imageName: "house.fill", title: "Home", isSelected: selectedTab == .home)
      }
      .buttonStyle(PlainButtonStyle())

      Spacer()
      Button(action: { selectedTab = .rewards }) {
        ToolbarItemView(imageName: "star.fill", title: "Rewards", isSelected: selectedTab == .rewards)
      }
      .buttonStyle(PlainButtonStyle())

      Spacer()
      Button(action: { selectedTab = .journals }) {
        ToolbarItemView(imageName: "book.fill", title: "Journals", isSelected: selectedTab == .journals)
      }
      .buttonStyle(PlainButtonStyle())

      Spacer()
      Button(action: { selectedTab = .profile }) {
        ToolbarItemView(imageName: "person.fill", title: "Profile", isSelected: selectedTab == .profile)
      }
      .buttonStyle(PlainButtonStyle())

      Spacer()
    }
    .padding(.vertical, 10)
    .background(Color.appDarkBlue)
    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: -4)
  }
}

struct ToolbarItemView: View {
  let imageName: String
  let title: String
  let isSelected: Bool

  var body: some View {
    VStack {
      Image(systemName: imageName)
        .font(.title2)
        .foregroundColor(isSelected ? .appTeal : .appLightBlue)
      Text(title)
        .font(.caption)
        .foregroundColor(isSelected ? .appTeal : .appLightBlue)
    }
    .frame(width: 80)
  }
}

#Preview {
  ContentView()
}
