import Foundation
import Capacitor
import WatchConnectivity

@objc(WatchPlugin)
public class WatchPlugin: CAPPlugin {
 
    override public func load() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleApplicationActive(notification:)),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleUrlOpened(notification:)),
                                               name: Notification.Name.capacitorOpenURL,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleUniversalLink(notification:)),
                                               name: Notification.Name.capacitorOpenUniversalLink,
                                               object: nil)
        
    }
    
    @objc func handleApplicationActive(notification: NSNotification) {
        assert(WCSession.isSupported(), "This sample requires Watch Connectivity support!")
        WCSession.default.delegate = CapWatchSessionDelegate.shared
        WCSession.default.activate()
    }
    
    @objc func handleUrlOpened(notification: NSNotification) {
        
    }

    @objc func handleUniversalLink(notification: NSNotification) {
        
    }
    
}
