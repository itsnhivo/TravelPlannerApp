import SwiftUI

struct Trip: Identifiable {
    let id = UUID()
    let name: String
}

class TripStore: ObservableObject {
    static let shared = TripStore()
    @Published var trips: [Trip] = [
        Trip(name: "1"),
        Trip(name: "2"),
        Trip(name: "3")
    ]
    func addTrip() {
            let newTripNumber = trips.count + 1
            trips.append(Trip(name: "\(newTripNumber)"))
        }
}

struct TripsView: View {
    @ObservedObject var tripStore = TripStore.shared

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                Text("Your trips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                // Scrollable content
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                        ForEach(tripStore.trips) { trip in
                            TripCard(title: trip.name)
                        }

                        // Add button
                        Button(action: {
                            tripStore.addTrip()
                        }) {
                            TripCard(title: "+")
                        }
                    }
                    .padding()
                }

                // Bottom Tab Bar
                HStack {
                    Spacer()
                    NavigationLink (destination: Rewards()) {
                    VStack {
                        Image(systemName: "star")
                        Text("Rewards")
                            .font(.caption)
                        }
                    }
                    Spacer()
                    NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                        VStack {
                            Image(systemName: "book")
                            Text("Journals")
                                .font(.caption)
                        }
                    }
                    Spacer()
                    NavigationLink (destination: Profile(userData: UserData(username: "", password: ""))) {
                        VStack {
                            Image(systemName: "person")
                            Text("Profile")
                                .font(.caption)
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.systemGray6))
            }
            .navigationBarHidden(true)
        }
    }
}

struct TripCard: View {
    let title: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.2))
                .frame(height: 100)
            Text(title)
                .font(.title)
                .bold()
        }
    }
}

struct trip1view: View {
    var body: some View {
        TripsView()
    }
}

#Preview {
    trip1view()
}


