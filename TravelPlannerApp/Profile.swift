//
//  Profile.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/29/25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 300.0)
                Circle()
                    .frame(width: 280.0)
                    .foregroundColor(Color(hue: 0.0, saturation: 0.124, brightness: 1.0))
            }
            .offset(y:-200)
            
        }
    }
}

#Preview {
    Profile()
}
