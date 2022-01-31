//
//  Slots_SwiftUIApp.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 1/29/22.
//

import SwiftUI

@main
struct Slots_SwiftUIApp: App {
    let slotsManager : SlotsLogicManager = SlotsLogicManager()
    var body: some Scene {
        WindowGroup {
            ContentView(slotsManager: slotsManager)
                .onReceive(
                    NotificationCenter.default.publisher(for: UIScene.willConnectNotification)
                ) { _ in
                    #if targetEnvironment(macCatalyst)
                    UIApplication.shared.connectedScenes
                        .compactMap { $0 as? UIWindowScene }
                        .forEach { windowScene in
                            windowScene.sizeRestrictions?.minimumSize = CGSize(width: 600, height: 800)
                        }
                    #endif
                }
        }
    }
}
