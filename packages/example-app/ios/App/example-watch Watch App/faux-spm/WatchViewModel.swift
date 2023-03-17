//
//  WatchViewModel.swift
//
//
//  Created by Dan Giralté on 2/24/23.
//

import Foundation
import WatchConnectivity
import SwiftUI

class WatchViewModel: NSObject, WCSessionDelegate, ObservableObject {
    var session: WCSession
    
    static var shared = WatchViewModel()
    
    @AppStorage(SAVEDUI_KEY) var savedUI: String = ""
    
    @Published var watchUI = ""
    @Published var viewData: [String: String]?
    
    init(session: WCSession = .default, viewData: [String: String]? = nil) {
        self.session = session
        self.viewData = viewData
        
        super.init()
        
        if savedUI != "" {
            self.watchUI = self.savedUI
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // apple docs say this won't work on simulator
        
        if WatchViewModel.shared.watchUI.isEmpty {
            let _ = session.transferUserInfo(REQUESTUI)
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.watchUI = message[UI_KEY] as? String ?? ""
            
            self.savedUI = self.watchUI
        }
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        DispatchQueue.main.async {
            self.watchUI = applicationContext[UI_KEY] as? String ?? ""
            self.savedUI = self.watchUI
        }
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        DispatchQueue.main.async {
            if let newUI = userInfo[UI_KEY] as? String {
                self.watchUI = newUI
                print("new watchUI: \(self.watchUI)")
                self.savedUI = self.watchUI
            }
            
            if let newViewData = userInfo[DATA_KEY] as? [String: String] {
                self.viewData = newViewData
            }
        }
    }
    
    // required protocol stubs?
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}

