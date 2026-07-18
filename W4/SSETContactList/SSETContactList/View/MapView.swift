//
//  MapView.swift
//  SSETContactList
//
//  Created by Van Tai on 18/7/26.
//

import SwiftUI
import MapKit

struct MapView: View{
    let myLocation: CLLocationCoordinate2D
    
    var body: some View {
        Map(initialPosition: .region(MKCoordinateRegion(
            center: myLocation, span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        ))){
            Marker("My House", coordinate: myLocation)
        }
            
    }
}


#Preview {
    MapView(myLocation: CLLocationCoordinate2D(latitude: 10.729227879505439, longitude: 106.69579948556701))
}
