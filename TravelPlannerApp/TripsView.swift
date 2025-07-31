//
//  trip1view.swift
//  TravelPlannerApp
//
//  Created by Joyce Yang on 7/29/25.
//

import SwiftUI

struct TripsView: View {
    @ObservedObject var tripStore = TripStore.shared
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Your Trips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.appDarkBlue)
                    .padding(.top, 20)
                    .padding(.bottom, 10)

                List {
                    ForEach($tripStore.trips) { $trip in
                        NavigationLink(destination: DottedTrailView(trip: $trip)) {
                            TripCard(title: trip.name)
                        }
                    }
                    .onDelete(perform: tripStore.deleteTrip)
                }
                .listStyle(.plain)
                .background(Color.appLightBlue)
                
                Button(action: {
                    let newTripNumber = tripStore.trips.count + 1
                    let newTripName = "Trip \(newTripNumber)"
                    tripStore.addTrip(name: newTripName)
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add a New Trip")
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.appBlue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding()
                }
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
            }
            .background(Color.appLightBlue.ignoresSafeArea())
        }
    }
}

struct TripCard: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.appDarkBlue)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.appCream)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    TripsView()
}
