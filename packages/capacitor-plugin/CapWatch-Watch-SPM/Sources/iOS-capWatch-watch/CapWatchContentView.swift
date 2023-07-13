//
//  CapWatchContentView.swift
//  
//
//  Created by Dan Giralté on 2/24/23.
//

import SwiftUI

struct CapWatchContentView: View {
    @StateObject private var model = WatchViewModel.shared
    
    var body: some View {
        VStack {
            if model.watchUI == "" {
                Button(action: {
                    WatchViewModel.shared.session.sendMessage(REQUESTUI, replyHandler: nil) { error in
                        print("UI Delivery failed")
                    }
                }) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                Rectangle().frame(height: 1)
            } else {
                ScrollView {
                    CapWatchView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CapWatchContentView()
    }
}
