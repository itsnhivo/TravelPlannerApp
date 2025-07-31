//
//  ContentView.swift
//  TravelPlannerApp
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: trip1view()){
                    Text("trip")
                }
                NavigationLink(destination: journalsView()){
                    Text("Journals")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
