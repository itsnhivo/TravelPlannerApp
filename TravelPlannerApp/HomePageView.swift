//
// HomePageView.swift
// TravelPlannerApp
//
// Created by Scholar on 7/31/25.
//

import SwiftUI

struct HomePageView: View {
  @Binding var selectedTab: TabSelection

  let popularDestinations = [
    Destination(name: "Paris", imageName: "paris_icon", description: "City of Love"),
    Destination(name: "Tokyo", imageName: "tokyo_icon", description: "Vibrant Metropolis"),
    Destination(name: "Cairo", imageName: "cairo_icon", description: "Ancient Wonders"),
    Destination(name: "Rio", imageName: "rio_icon", description: "Carnival & Beaches")
  ]

  let mustSeeLandmarks = [
    Landmark(name: "Eiffel Tower", imageName: "eiffel_tower_icon"),
    Landmark(name: "Great Wall", imageName: "great_wall_icon"),
    Landmark(name: "Pyramids", imageName: "pyramids_icon"),
    Landmark(name: "Christ Redeemer", imageName: "christ_redeemer_icon")
  ]

  var body: some View {
    VStack(spacing: 0) {
      Text("Your Travel Planner")
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundColor(.appDarkBlue)
        .padding(.top, 20)
        .padding(.bottom, 10)

      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 30) {
          // Plan Your Next Trip section
          VStack(alignment: .leading, spacing: 15) {
            Text("Plan Your Next Trip!")
              .font(.title2)
              .fontWeight(.bold)
              .foregroundColor(.appBlue)

            Button(action: {
              selectedTab = .home
            }) {
              HStack {
                Image(systemName: "plus.circle.fill")
                  .font(.title)
                Text("Start a New Adventure")
                  .fontWeight(.semibold)
              }
              .padding()
              .frame(maxWidth: .infinity)
              .background(Color.appRed)
              .foregroundColor(.white)
              .cornerRadius(15)
              .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
            }
          }
          .padding(.horizontal)

          VStack(alignment: .leading) {
            Text("Popular Destinations")
              .font(.title2)
              .fontWeight(.bold)
              .foregroundColor(.appBlue)
              .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
              HStack(spacing: 15) {
                ForEach(popularDestinations) { destination in
                  DestinationCard(destination: destination)
                }
              }
              .padding(.horizontal)
            }
          }
           
          VStack(alignment: .leading) {
            Text("Must-See Landmarks")
              .font(.title2)
              .fontWeight(.bold)
              .foregroundColor(.appBlue)
              .padding(.leading)
             
            ScrollView(.horizontal, showsIndicators: false) {
              HStack(spacing: 15) {
                ForEach(mustSeeLandmarks) { landmark in
                  LandmarkCard(landmark: landmark)
                }
              }
              .padding(.horizontal)
            }
          }
        }
        .padding(.bottom, 20)
      }
    }
  }
}

struct DestinationCard: View {
  let destination: Destination

  var body: some View {
    VStack {
      Image(destination.imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 120, height: 100)
        .clipped()
        .cornerRadius(10)
        .shadow(radius: 3)

      Text(destination.name)
        .font(.headline)
        .fontWeight(.semibold)
        .foregroundColor(.appDarkBlue)

      Text(destination.description)
        .font(.caption)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
    }
    .padding(10)
    .background(Color.appCream)
    .cornerRadius(15)
    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
  }
}

struct LandmarkCard: View {
  let landmark: Landmark

  var body: some View {
    VStack {
      Image(landmark.imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 100, height: 100)
        .clipped()
        .cornerRadius(50)
        .overlay(Circle().stroke(Color.appTeal, lineWidth: 3))
        .shadow(radius: 5)

      Text(landmark.name)
        .font(.subheadline)
        .fontWeight(.medium)
        .foregroundColor(.appDarkBlue)
        .multilineTextAlignment(.center)
    }
    .padding(8)
    .background(Color.appLightOrange.opacity(0.2))
    .cornerRadius(60)
    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
  }
}

#Preview {
  HomePageView(selectedTab: .constant(.home))
}
