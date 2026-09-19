//
//  PlaceDetailView.swift
//  CampusCompass
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI

struct PlaceDetailView: View {
    let spot: Spot
    var body: some View {
        Text(spot.name)
    }
}

#Preview {
    NavigationStack{
        PlaceDetailView(
            spot: spotsData[0]
        )
    }
}
