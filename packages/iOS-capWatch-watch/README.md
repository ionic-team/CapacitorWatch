# CapWatch-watch-SPM

This is the Swift Package fo the watch half of the CapacitorWatch plugin. See the main readme for more details

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

```
