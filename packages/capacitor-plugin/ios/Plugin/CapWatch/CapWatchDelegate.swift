//
//  WatchSessionDelegate.swift
//  
//
//  Created by Dan Giralté on 2/24/23.
//

import WatchConnectivity
import CapacitorBackgroundRunner

public class CapWatchSessionDelegate : NSObject, WCSessionDelegate {
    var WATCH_UI = ""
    
    public static var shared = CapWatchSessionDelegate()
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("PHONE WatchDelagate activationDidCompleteWith")
    }
    
    #if os(iOS)
    
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    public func sessionDidDeactivate(_ session: WCSession) {
        // dcg - do we want this?
        session.activate()
    }
    
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        var args: [String: Any] = [:]
        args["message"] = message
        
        do {
            try BackgroundRunner.shared.dispatchEvent(event: "WatchConnectivity_didReceiveUserInfo", inputArgs: args)
        } catch {
            print(error)
        }
        
        handleWatchMessage(message)
    }
    
    public func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String: Any]) {
        handleWatchMessage(applicationContext)
    }
    
    public func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        // print("PHONE got didReceiveUserInfo: \(userInfo)")
        var args: [String: Any] = [:]
        args["userInfo"] = userInfo
        
        do {
            try BackgroundRunner.shared.dispatchEvent(event: "WatchConnectivity_didReceiveUserInfo", inputArgs: args)
        } catch {
            print(error)
        }
        
        handleWatchMessage(userInfo)
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
    
    func handleWatchMessage(_ userInfo: [String: Any]) {
        if let command = userInfo[REQUESTUI_KEY] as? String {
            if command == REQUESTUI_VALUE {
                sendUI()
            }
        }
        
        if let command = userInfo[COMMAND_KEY] as? String {
            print("PHONE process: \(command)")
            commandToJS(command)
        }
    }

    #endif
}
