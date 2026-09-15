//
//  Contact.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import Foundation
import SwiftUI

struct Contact {
    let name: String
    let email: String
    let phoneNumber: String
    let imageName: String
    
    var image: Image {
        Image(imageName)
    }
}

extension Contact {
    static let sampleContacts: [Contact] = [
        Contact(name: "Tom Huynh", email: "tom.huynh@rmit.edu.vn", phoneNumber: "0912325232", imageName: "tom-huynh"),
        Contact(name: "Brett Kirk", email: "brett.kirk@rmit.edu.vn", phoneNumber: "09435325634", imageName: "brett-kirk"),
        Contact(name: "Minh Dinh", email: "minh.dinh4@rmit.edu.vn", phoneNumber: "0853453563", imageName: "minh-dinh"),
        Contact(name: "Tri Dang", email: "tri.dangtran@rmit.edu.vn", phoneNumber: "0617486566", imageName: "tri-dang"),
        Contact(name: "Long Nguyen", email: "long.nguyenminh@rmit.edu.vn", phoneNumber: "09624567254", imageName: "long-nguyen"),
        Contact(name: "Minh Vu", email: "minh.vu@rmit.edu.vn", phoneNumber: "09346344534", imageName: "minh-vu"),
        Contact(name: "Linh Tran", email: "linh.tranduc@rmit.edu.vn", phoneNumber: "0954634745", imageName: "linh-tran"),
        Contact(name: "Alberto", email: "alberto@rmit.edu.vn", phoneNumber: "094354456", imageName: "alberto"),
        Contact(name: "Cuong Nguyen", email: "cuong.nguyen@rmit.edu.vn", phoneNumber: "0922342355", imageName: "cuong-nguyen"),
        Contact(name: "Khuong Nguyen", email: "khuong.nguyen@rmit.edu.vn", phoneNumber: "0945334613", imageName: "khuong-nguyen"),
        Contact(name: "Luan Nguyen", email: "luan.nguyen@rmit.edu.vn", phoneNumber: "0925342356", imageName: "luan-nguyen"),
        Contact(name: "Minh Tran", email: "minh.tran@rmit.edu.vn", phoneNumber: "0952534523", imageName: "minh-tran"),
        Contact(name: "Sam Goundar", email: "sam.goundar@rmit.edu.vn", phoneNumber: "095534534", imageName: "sam-goundar"),
        Contact(name: "Ushik Shrestha", email: "ushik.shrestha@rmit.edu.vn", phoneNumber: "0922345123", imageName: "ushik-shrestha")
    ]
    
    static let sampleContact = sampleContacts[0]
}
