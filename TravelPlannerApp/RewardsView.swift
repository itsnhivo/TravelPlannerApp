//
// rewardsView.swift
// TravelPlannerApp
//
// Created by Yueqing Cai on 7/29/25.
//

import SwiftUI

struct RewardsView: View {
  let rewards = [
    CosmeticReward(name: "Vintage Luggage", imageName: "luggage"),
    CosmeticReward(name: "Compass Pin", imageName: "compass"),
    CosmeticReward(name: "World Map Skin", imageName: "map"),
    CosmeticReward(name: "Passport Sticker", imageName: "passport"),
    CosmeticReward(name: "Airplane Icon", imageName: "airplane"),
    CosmeticReward(name: "Traveler Badge", imageName: "badge")
  ]

  var body: some View {
    VStack(spacing: 0) {
      Text("Your Rewards")
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundColor(.appDarkBlue)
        .padding(.top, 20)
        .padding(.bottom, 10)

      ScrollView {
        VStack(spacing: 20) {
          ForEach(rewards) { reward in
            RewardCard(reward: reward)
          }
        }
        .padding()
      }
    }
    .background(Color.appLightBlue.ignoresSafeArea())
  }
}

struct RewardCard: View {
  let reward: CosmeticReward

  var body: some View {
    HStack(spacing: 20) {
      Image(systemName: reward.imageName)
        .resizable()
        .scaledToFit()
        .frame(width: 60, height: 60)
        .foregroundColor(.appBlue)
        .padding(10)
        .background(Color.appTeal.opacity(0.4))
        .clipShape(Circle())

      VStack(alignment: .leading, spacing: 5) {
        Text(reward.name)
          .font(.headline)
          .fontWeight(.semibold)
          .foregroundColor(.appDarkBlue)

        Text("Achieved for completing a trip!")
          .font(.subheadline)
          .foregroundColor(.gray)
      }

      Spacer()

      Image(systemName: "checkmark.circle.fill")
        .font(.title)
        .foregroundColor(.green)
    }
    .padding()
    .background(Color.appCream)
    .cornerRadius(15)
    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
  }
}

#Preview {
  RewardsView()
}
