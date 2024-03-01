//
//  Offline_GamesApp.swift
//  Offline Games
//
//  Created by Vedant Arora on 04/02/24.
//

import SwiftUI

enum Route {
    case Content
    case RockPaperScissors
}

@main
struct Offline_GamesApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
