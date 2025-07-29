//
//  rewardsView.swift
//  TravelPlannerApp
//
//  Created by Yueqing Cai on 7/29/25.
//

import SwiftUI

struct rewardsView: View {
    var body: some View {
        Text("Rewards")
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth:.infinity)
            .background(Color.gray)
        ScrollView{
            VStack{
                ForEach(1..<10){ index in
                    ZStack{
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 360.0, height: 160.0)
                            .cornerRadius(15)
                        HStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width:120)
                                .offset(x:-80)
                            Text("text")
                                .multilineTextAlignment(.leading)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    rewardsView()
}
