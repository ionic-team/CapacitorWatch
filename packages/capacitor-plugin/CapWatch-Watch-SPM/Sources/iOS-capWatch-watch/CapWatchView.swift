//
//  CapWatchView.swift
//  
//
//  Created by Dan Giralté on 2/24/23.
//

import SwiftUI

struct CapWatchView: View {
    @StateObject private var viewModel = WatchViewModel.shared
    
    var views: [CapWatchComponentView] = []
    
    init() {
        // parse viewModel.watchUI
        let components = viewModel.watchUI.lines
        
        // iterate over components and add views to views array
        for element in components {
            views.append(CapWatchComponentView(String(element), viewModel.viewData))
        }
    }
    
    var body: some View {
        VStack {
            if views.isEmpty {
                Text("Waiting for UI from Phone...")
            }
            ForEach(views) { thisView in
                thisView
            }
        }
        .onAppear() {
            
        }
    }
}
