//
//  SwiftMapAppApp.swift
//  SwiftMapApp
//
//  Created by kxx: on 2023/03/07.
//

import SwiftUI

@main
struct SwiftMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
