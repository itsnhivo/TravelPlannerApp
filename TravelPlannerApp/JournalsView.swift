//
//  journalsView.swift
//  TravelPlannerApp
//
//  Created by Yueqing Cai on 7/29/25.
//


import SwiftUI

struct JournalsView: View {
    @ObservedObject var tripStore = TripStore.shared

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Your Journals")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.appDarkBlue)
                    .padding(.top, 20)
                    .padding(.bottom, 10)

                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach($tripStore.trips) { $trip in
                            JournalBox(trip: $trip)
                        }
                    }
                    .padding()
                }
            }
            .background(Color.appLightBlue.ignoresSafeArea())
        }
    }
}

struct JournalBox: View {
    @Binding var trip: Trip
    
    var body: some View {
        NavigationLink(destination: JournalDetailView(trip: $trip)) {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(trip.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.appDarkBlue)
                    
                    Text(trip.journalEntry.isEmpty ? "No journal entry yet." : trip.journalEntry)
                        .font(.caption)
                        .foregroundColor(trip.journalEntry.isEmpty ? .gray : .appDarkBlue)
                        .italic(trip.journalEntry.isEmpty)
                        .lineLimit(2)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.appBlue)
            }
            .padding()
            .background(Color.appCream)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
        }
    }
}

struct JournalDetailView: View {
    @Binding var trip: Trip
    @State private var isEditing = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(trip.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.appDarkBlue)
                
                Spacer()
                
                Button(action: {
                    isEditing.toggle()
                }) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.title)
                        .foregroundColor(.appBlue)
                }
            }
            .padding(.horizontal)
            
            if isEditing {
                JournalEditView(text: $trip.journalEntry, isEditing: $isEditing)
            } else {
                if trip.journalEntry.isEmpty {
                    Text("No journal entry yet. Tap the pencil to add your thoughts about this trip!")
                        .foregroundColor(.gray)
                        .italic()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.appCream)
                        .cornerRadius(15)
                } else {
                    Text(trip.journalEntry)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.appCream)
                        .cornerRadius(15)
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Journal")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.appLightBlue.ignoresSafeArea())
    }
}

struct JournalEditView: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            TextEditor(text: $text)
                .frame(minHeight: 200)
                .padding(8)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
            
            HStack {
                Button("Cancel") {
                    isEditing = false
                }
                .padding()
                .foregroundColor(.appRed)

                Spacer()
                
                Button("Save") {
                    isEditing = false
                }
                .padding()
                .foregroundColor(.appBlue)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    JournalsView()
}
