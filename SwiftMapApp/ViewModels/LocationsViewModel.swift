//
//  LocationsViewModel.swift
//  SwiftMapApp
//
//  Created by kxx: on 2023/03/07.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
     func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtomPressed() {
        // Get the current index
        guard let currentIndex = locations.firstIndex(where:  { $0 == mapLocation }) else { return }

    
        // check if the currentIndex is valid
        let nextIntex = currentIndex + 1
        guard locations.indices.contains(nextIntex) else {
            // next index is not valid
            // restart from 0
            guard let firstlocation = locations.first else { return }
            showNextLocation(location: firstlocation)
            return
        }
        
        // next index is valid
        let nextlocation = locations[nextIntex]
        showNextLocation(location: nextlocation)

        
        
    }
}
