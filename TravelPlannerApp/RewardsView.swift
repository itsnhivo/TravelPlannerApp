//
//  Rewards.swift
//  TravelPlannerApp
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI

struct RewardsView: View {
    @Binding var selectedTab: TabSelection
    
    let rewards: [CosmeticReward] = [
        CosmeticReward(name: "Hawaii Profile Picture", imageName: "hawaii"),
        CosmeticReward(name: "China Profile Picture", imageName: "china"),
        CosmeticReward(name: "Russia Profile Picture", imageName: "russia")]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(rewards) { reward in
                        HStack(spacing: 30) {
                            Image(reward.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipped()
                                .foregroundColor(.blue)
                            Text(reward.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RewardsView(selectedTab: .constant(.rewards))
}
