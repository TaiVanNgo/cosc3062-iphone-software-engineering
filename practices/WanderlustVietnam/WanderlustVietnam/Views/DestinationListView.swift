//
//  DestinationListView.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI

struct DestinationListView: View {
    let destinations: [Destination]
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 25){
                ForEach(destinations, id: \.self) { des in
                    NavigationLink {
                        DetailView(destination: des)
                    } label: {
                        HStack (spacing: 15){
                            Image(des.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            VStack (alignment: .leading){
                                Text(des.name)
                                    .font(.title)
                                    .foregroundStyle(.brandPrimary)
                                    .fontWeight(.bold)
                                
                                Text(des.headline)
                                    .foregroundStyle(.brandSecondary)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    DestinationListView(
        destinations: destinationData
    )
}
