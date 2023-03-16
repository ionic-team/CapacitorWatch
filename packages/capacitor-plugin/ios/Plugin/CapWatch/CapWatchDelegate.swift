//
//  CapWatchDelegate.swift
//  Plugin
//
//  Created by Dan Giralté on 3/16/23.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import WatchConnectivity

public class CapWatchSessionDelegate : NSObject, WCSessionDelegate {
    var WATCH_UI = ""
    
    static var shared = CapWatchSessionDelegate()
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    #if os(iOS)
    
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    public func sessionDidDeactivate(_ session: WCSession) {
        // dcg - do we want this?
        session.activate()
    }
    
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        let command = message[REQUESTUI_KEY] as? String ?? ""
        
        if command == REQUESTUI_VALUE {
            sendUI()
        }
    }
    
    public func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String: Any]) {
        let command = applicationContext[REQUESTUI_KEY] as? String ?? ""
        
        if command == REQUESTUI_VALUE {
            sendUI()
        }
    }
    
    public func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print("PHONE got didReceiveUserInfo: \(userInfo)")
        
        if let command = userInfo[REQUESTUI_KEY] as? String {
            if command == REQUESTUI_VALUE {
                sendUI()
            }
        }
        
        if let command = userInfo[COMMAND_KEY] as? String {
            print("process: \(command)")
            commandToJS(command)
        }
    }
        
    func updateViewData(_ data: [String: String]) {
        DispatchQueue.main.async {
            let _ = WCSession.default.transferUserInfo([DATA_KEY: data])
        }
    }
    
    func sendUI() {
        let _ = WCSession.default.transferUserInfo([UI_KEY : WATCH_UI])
    }
    
    func commandToJS(_ command: String) {
        NotificationCenter.default.post(name: Notification.Name(COMMAND_KEY),
                                        object: nil,
                                        userInfo: [COMMAND_KEY: command])
    }
    
    #endif
}
