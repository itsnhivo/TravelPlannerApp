//
//  journalsView.swift
//  TravelPlannerApp
//
//  Created by Yueqing Cai on 7/29/25.
//

import SwiftUI

private let trips = [
    Trip(name: "Tokyo Adventure"),
    Trip(name: "Paris Trip")
]

struct journalsView: View {
    @ObservedObject var tripStore = TripStore.shared
    var body: some View {
        HStack {
            Text("Journals")
                .font(.largeTitle)
                .bold()
        }
            
        NavigationView{
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(tripStore.trips){ trip in
                            journalBox(trip: trip)
                        }
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct journalBox: View{
    let trip: Trip
    var body: some View{
        NavigationLink(destination: JournalDetailView(trip: trip)) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(trip.name)
                            .font(.headline)
                    }
                    Spacer()
                }
                Text("Empty")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
        }
    }
}

struct JournalDetailView: View {
    let trip: Trip
    @State private var text = ""
    @State private var isEditing = false
    
    var body: some View{
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack(alignment: .leading) {
                    Text(trip.name)
                        .font(.title)
                        .bold()
                }

                Spacer()
                
                Button{
                    isEditing = true
                } label:{
                    Image(systemName: "pencil")
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            if isEditing {
                journalEdit(text: $text)
            }
            else {
                if text.isEmpty {
                    Text("No journal entry yet. Tap Edit to add your thoughts about this trip!")
                        .foregroundColor(.gray)
                        .italic()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(8)
                } else {
                    Text(text)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(8)
                }
                
            }
        }
    }
}
struct journalEdit: View {
    @Binding var text: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView{
            TextField("How was the trip?", text: $text)
                .frame(minHeight: 200)
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
        .padding()
        .navigationTitle("Edit Journal")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    
                    dismiss()
                }
            }
        }
    }
}
#Preview {
    journalsView()
}
