//
//  CapWatchComponentView.swift
//  
//
//  Created by Dan Giralté on 2/24/23.
//

import SwiftUI
import WatchConnectivity

struct CapWatchComponentView : View, Identifiable {
    var id: UUID
    
    var controlType: String
    var controlParams: String
    var splitParams: [Substring]
    
    var viewModel: [String: String]?
    
    init(_ control: String, _ vm: [String: String]? = nil) {
        viewModel = vm
        
        let getType = control.split(separator: #"(""#)
        controlType = String(getType[0])
        
        let getParams = getType[1].split(separator: #"")"#)
        controlParams = String(getParams[0])
        
        splitParams = controlParams.replacing("\"", with: "").split(separator: ", ")
        
        id = UUID()
    }
    
    var body: some View {
        if controlType == "Text" {
            CapWatchText(controlParams, viewModel)
                .foregroundColor(.white)
        } else if controlType == "Button" {
            Button(
                action: { WCSession.default.transferUserInfo([COMMAND_KEY:splitParams[1]]) },
                label: {
                    CapWatchText(String(splitParams[0]), viewModel)
                }
            ).foregroundColor(.white)
        }
    }
}

