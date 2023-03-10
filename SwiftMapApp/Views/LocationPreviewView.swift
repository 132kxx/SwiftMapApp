//
//  LocationPreviewView.swift
//  SwiftMapApp
//
//  Created by kxx: on 2023/03/10.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    
    var body: some View {
        VStack(spacing: 16.0) {
            
            imageSection
            
            VStack(alignment: .leading, spacing: 4) {
                Text(location.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(location.cityName)
                    .font(.subheadline)
            }
        }
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.blue.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
        }
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
}
