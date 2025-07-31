import SwiftUI

struct TripsView: View {
    @Binding var selectedTab: TabSelection
    
    @State private var trips: [Trip] = [
        Trip(name: "1"),
        Trip(name: "2"),
        Trip(name: "3")
    ]

    var body: some View {
            VStack(spacing: 0) {
                // Header
                Text("Your trips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                // Scrollable content
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                        ForEach(trips) { trip in
                            TripCard(title: trip.name)
                        }

                        // Add button
                        Button(action: {
                            let newTripNumber = trips.count + 1
                            trips.append(Trip(name: "\(newTripNumber)"))
                        }) {
                            TripCard(title: "+")
                                .background(Color.green.opacity(0.2))
                        }
                    }
                    .padding()
                }
            }
        }
    }

struct TripCard: View {
    let title: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue.opacity(0.3))
                .frame(height: 120)
                .shadow(radius: 5)
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    TripsView(selectedTab: .constant(.home))
}


