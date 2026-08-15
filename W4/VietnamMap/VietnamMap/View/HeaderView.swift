//
//  HeaderView.swift
//  VietnamMap
//
//  Created by Van Tai on 19/7/26.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        
        HStack{
            Text("RMIT")
                .foregroundStyle(.red)
                
            Text("Location")
                .foregroundStyle(.blue)
        }.font(.system(size: 40, weight: .black))
    }
}

#Preview {
    HeaderView()
}
