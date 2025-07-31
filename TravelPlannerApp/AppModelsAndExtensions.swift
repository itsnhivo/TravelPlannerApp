//
//  AppModelsAndExtensions.swift
//  TravelPlannerApp
//
//  Created by Scholar on 7/31/25.
//

import Foundation
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
}

enum TabSelection {
    case home
    case rewards
    case journals
    case profile
}

struct Trip: Identifiable {
    let id = UUID()
    var name: String
    var journalEntry: String = ""
    var stops: [TrailStop] = []
}

struct TrailStop: Identifiable {
    let id = UUID()
    var position: CGPoint
    var label: String
}

struct CosmeticReward: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct Destination: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}


class TripStore: ObservableObject {
    static let shared = TripStore()
    @Published var trips: [Trip] = [
        Trip(name: "Tokyo Adventure", journalEntry: "A vibrant city with amazing food and culture."),
        Trip(name: "Paris Getaway", journalEntry: "The city of love lived up to its name!"),
        Trip(name: "NYC Trip", journalEntry: "The city that never sleeps. It was an incredible experience!")
    ]

    func addTrip(name: String) {
        let newTrip = Trip(name: name, stops: [
            TrailStop(position: CGPoint(x: 120, y: 100), label: "Stop 1"),
            TrailStop(position: CGPoint(x: 250, y: 210), label: "Stop 2"),
            TrailStop(position: CGPoint(x: 120, y: 320), label: "Stop 3")
        ])
        trips.append(newTrip)
    }
    
    func deleteTrip(at offsets: IndexSet) {
        trips.remove(atOffsets: offsets)
    }
}

class UserData: ObservableObject {
    @Published var username: String
    @Published var password: String
    @Published var email: String

    init(username: String = "", password: String = "", email: String = "") {
        self.username = username
        self.password = password
        self.email = email
    }
}
