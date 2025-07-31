//
//  UserInfo.swift
//  TravelPlannerApp
//
//  Created by Placidia Ong on 7/30/25.
//

import Foundation

class UserData: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
