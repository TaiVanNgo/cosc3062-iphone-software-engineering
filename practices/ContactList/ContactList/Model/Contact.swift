//
//  Contact.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import Foundation
import SwiftUI
import CoreLocation

struct Contact {
    let name: String
    let email: String
    let phoneNumber: String
    let imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    let locationCoordinate: CLLocationCoordinate2D
}

extension Contact {
    static let sampleContacts: [Contact] = [
        Contact(name: "Tom Huynh", email: "tom.huynh@rmit.edu.vn", phoneNumber: "0912325232", imageName: "tom-huynh", locationCoordinate: CLLocationCoordinate2D(latitude: 10.729410965174186, longitude: 106.69522548892152)),
            Contact(name: "Brett Kirk", email: "brett.kirk@rmit.edu.vn", phoneNumber: "09435325634", imageName: "brett-kirk", locationCoordinate: CLLocationCoordinate2D(latitude: 10.758256325746386, longitude: 106.67228491141948)),
            Contact(name: "Minh Dinh", email: "minh.dinh4@rmit.edu.vn", phoneNumber: "0853453563", imageName: "minh-dinh", locationCoordinate: CLLocationCoordinate2D(latitude: 10.786710386116287, longitude: 106.73818415444727)),
            Contact(name: "Tri Dang", email: "tri.dangtran@rmit.edu.vn", phoneNumber: "0617486566", imageName: "tri-dang", locationCoordinate: CLLocationCoordinate2D(latitude: 10.79437079611712, longitude: 106.80394039521534)),
            Contact(name: "Long Nguyen", email: "long.nguyenminh@rmit.edu.vn", phoneNumber: "09624567254", imageName: "long-nguyen", locationCoordinate: CLLocationCoordinate2D(latitude: 10.870169083568735, longitude: 106.76307939055084)),
            Contact(name: "Minh Vu", email: "minh.vu@rmit.edu.vn", phoneNumber: "09346344534", imageName: "minh-vu", locationCoordinate: CLLocationCoordinate2D(latitude: 10.949713377874208, longitude: 106.8479555990988)),
            Contact(name: "Linh Tran", email: "linh.tranduc@rmit.edu.vn", phoneNumber: "0954634745", imageName: "linh-tran", locationCoordinate: CLLocationCoordinate2D(latitude: 11.04578475693659, longitude: 106.58373092288061)),
            Contact(name: "Alberto", email: "alberto@rmit.edu.vn", phoneNumber: "094354456", imageName: "alberto", locationCoordinate: CLLocationCoordinate2D(latitude: 10.803071448238558, longitude: 106.64427589071033)),
            Contact(name: "Cuong Nguyen", email: "cuong.nguyen@rmit.edu.vn", phoneNumber: "0922342355", imageName: "cuong-nguyen", locationCoordinate: CLLocationCoordinate2D(latitude: 10.781771420238698, longitude: 106.6306334151885)),
            Contact(name: "Khuong Nguyen", email: "khuong.nguyen@rmit.edu.vn", phoneNumber: "0945334613", imageName: "khuong-nguyen", locationCoordinate: CLLocationCoordinate2D(latitude: 10.745642963019284, longitude: 106.57460623743862)),
            Contact(name: "Luan Nguyen", email: "luan.nguyen@rmit.edu.vn", phoneNumber: "0925342356", imageName: "luan-nguyen", locationCoordinate: CLLocationCoordinate2D(latitude: 10.642054789728482, longitude: 106.43875526875854)),
            Contact(name: "Minh Tran", email: "minh.tran@rmit.edu.vn", phoneNumber: "0952534523", imageName: "minh-tran", locationCoordinate: CLLocationCoordinate2D(latitude: 10.23862895243684, longitude: 106.3776103458168)),
            Contact(name: "Sam Goundar", email: "sam.goundar@rmit.edu.vn", phoneNumber: "095534534", imageName: "sam-goundar", locationCoordinate: CLLocationCoordinate2D(latitude: 9.991073220047838, longitude: 106.0169751879182)),
            Contact(name: "Ushik Shrestha", email: "ushik.shrestha@rmit.edu.vn", phoneNumber: "0922345123", imageName: "ushik-shrestha", locationCoordinate: CLLocationCoordinate2D(latitude: 11.940952669293084, longitude: 108.45964507946036))

    ]
    
    static let sampleContact = sampleContacts[0]
}
