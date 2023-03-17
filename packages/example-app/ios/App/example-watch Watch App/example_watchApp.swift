//
//  example_watchApp.swift
//  example-watch Watch App
//
//  Created by Dan Giralté on 3/17/23.
//

import SwiftUI
import WatchConnectivity

@main
struct example_watch_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            CapWatchView()
                .onAppear {
                    assert(WCSession.isSupported(), "This sample requires Watch Connectivity support!")
                    WCSession.default.delegate = WatchViewModel.shared
                    WCSession.default.activate()
                }
        }
    }
}
