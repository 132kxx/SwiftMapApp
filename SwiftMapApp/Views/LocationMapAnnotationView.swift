//
//  LocationMapAnnotationView.swift
//  SwiftMapApp
//
//  Created by kxx: on 2023/03/17.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.red)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(180))
                .offset(y: -3)
                .padding(.bottom, 35)

        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()

        }
    }
}
