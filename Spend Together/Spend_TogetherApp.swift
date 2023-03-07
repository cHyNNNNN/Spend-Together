//
//  Spend_TogetherApp.swift
//  Spend Together
//
//  Created by Jose Manuel Roldan Gomez on 7/3/23.
//

import SwiftUI

import SwiftUI

@main
struct Spend_TogetherApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingScreenView()
                .onDisappear {
                                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: ContentView())
                                }
        }
    }
}

