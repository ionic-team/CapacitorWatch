# iOS-capWatch-watch

This is a prototype for the watch app:

```
import SwiftUI
import WatchConnectivity

let WATCHUI_KEY = "CAPWATCH_UI"

@main
struct my_Watch_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    WCSession.default.delegate = WatchViewModel.shared
                    WCSession.default.activate()
                }
        }
    }
}
```
