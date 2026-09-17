import SwiftUI
import MapKit

struct MapView: View {
    let location: CLLocationCoordinate2D
    
    @State private var cameraPosition: MapCameraPosition
       
    init(location: CLLocationCoordinate2D){
        self.location = location
        
        let region = MKCoordinateRegion(
            center: location,
            span: MKCoordinateSpan(
                latitudeDelta: 0.004,
                longitudeDelta: 0.004
            )
        )
        
        _cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        Map(position: $cameraPosition) {
            Marker("Location", coordinate: location)
        }

    }
}

#Preview {
    MapView(
        location: Contact.sampleContact.locationCoordinate
    )
}
