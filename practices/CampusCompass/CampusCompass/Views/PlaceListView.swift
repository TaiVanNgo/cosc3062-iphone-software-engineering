//
//  PlaceListView.swift
//  CampusCompass
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI

struct PlaceListView: View {
    let spots: [Spot]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(spots) { spot in
                    NavigationLink {
//                        <#DestinationView#>(item: item)
                    } label: {
                        HStack{
                            Image(systemName: spot.symbol)
                                .font(.title)
                                .foregroundStyle(.white)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(.create)
                                )
                            
                            VStack(alignment: .leading){
                                Text(spot.name)
                                    .font(.headline)
                                    .bold()
                                
                                Text(spot.building)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                
                                Text(spot.category)
                                    .font(.caption)
                                    .foregroundStyle(.brandSecondary)
                            }
                            
                            
                                

                        }
                    }
                }
            }
            .navigationTitle("Places")
         
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Button("Setting", systemImage: "gear") {
                            
                        }
                 
                    }
                }
            }
           
        }
        
    }
}

#Preview {
    PlaceListView(
        spots: spotsData
    )
}
