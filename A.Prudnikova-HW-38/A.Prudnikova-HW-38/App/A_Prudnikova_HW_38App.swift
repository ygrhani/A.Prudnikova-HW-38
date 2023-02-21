//
//  A_Prudnikova_HW_38App.swift
//  A.Prudnikova-HW-38
//
//  Created by Ann Prudnikova on 21.02.23.
//

import SwiftUI

@main
struct A_Prudnikova_HW_38App: App {
    @StateObject private var user = UserManager()
    
    var body: some Scene {
        
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}

