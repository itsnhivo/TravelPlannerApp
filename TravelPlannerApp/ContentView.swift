//
//  ContentView.swift
//  TravelPlannerApp
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    static let appRed = Color(hex: "D64045")
    static let appLightBlue = Color(hex: "E9FFF9")
    static let appTeal = Color(hex: "9ED8D8")
    static let appBlue = Color(hex: "467599")
    static let appDarkBlue = Color(hex: "1D3354")
    static let appCyan = Color(hex: "00AFB9")
    static let appCream = Color(hex: "FDFCDC")
    static let appLightOrange = Color(hex: "FED9B7")
    static let appSalmon = Color(hex: "F07167")
    
    struct CosmeticReward: Identifiable {
        let id = UUID()
        let name: String
        let imageName: String
    }
    
    enum TabSelection {
        case home
        case rewards
        case journals
        case profile
    }
    
    struct ContentView: View {
        @State private var selectedTab: TabSelection = .home
        var body: some View {
            NavigationView {
                VStack(spacing: 0) {
                    Group {
                        if selectedTab == .home {
                            TripsView(selectedTab: $selectedTab)
                        } else if selectedTab == .rewards {
                            RewardsView(selectedTab: $selectedTab)
                        } else if selectedTab == .journals {
                            Text("Journals View (not done yet)")
                                .font(.largeTitle)
                                .foregroundColor(.purple)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.purple.opacity(0.1))
                                .cornerRadius(15)
                                .padding()
                        } else if selectedTab == .profile {
                            Text("Profile View (not done yet)")
                                .font(.largeTitle)
                                .foregroundColor(.purple)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.purple.opacity(0.1))
                                .cornerRadius(15)
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.appLightBlue.edgesIgnoringSafeArea(.all))
                    
                    BottomToolbarView(selectedTab: $selectedTab)
                }
                .navigationBarHidden(true)
            }
        }
    }
    
    struct BottomToolbarView: View {
        @Binding var selectedTab: TabSelection
        
        var body: some View {
            HStack {
                Spacer()
                Button(action: {
                    selectedTab = .home
                }) {
                    ToolbarItemView(imageName: "house.fill", title: "Home", isSelected: selectedTab == .home)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action: {
                    selectedTab = .rewards
                }) {
                    ToolbarItemView(imageName: "star.fill", title: "Rewards", isSelected: selectedTab == .rewards)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action: {
                    selectedTab = .journals
                }) {
                    ToolbarItemView(imageName: "book.fill", title: "Journals", isSelected: selectedTab == .journals)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action: {
                    selectedTab = .profile
                }) {
                    ToolbarItemView(imageName: "person.fill", title: "Profile", isSelected: selectedTab == .profile)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
            }
            .padding(.vertical, 10)
            .background(Color.appDarkBlue)
            .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: -4)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    struct ToolbarItemView: View {
        let imageName: String
        let title: String
        let isSelected: Bool
        
        var body: some View {
            VStack {
                Image(systemName: imageName)
                    .font(.title2)
                    .foregroundColor(isSelected ? .appTeal : .appLightBlue)
                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelected ? .appTeal : .appLightBlue)
            }
            .frame(width: 80)
        }
    }
    
    #Preview {
        ContentView()
    }
}
