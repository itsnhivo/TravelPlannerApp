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
                NavigationLink(destination: rewardsView()){
                    Text("Rewards")
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
