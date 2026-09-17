//
//  DetailView.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    let destination: Destination
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var favDestinationIDs: [FavouriteDestination]

    var isFav: Bool{
        favDestinationIDs.contains {$0.id == destination.id}
    }
    
    var body: some View {
        ZStack{
            Color(.background)
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Image(destination.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                    .padding(.top, 20)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 15) {
                        Text(destination.name)
                            .foregroundStyle(.brandPrimary)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(destination.province)
                            .foregroundStyle(.brandSecondary)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding(.horizontal)
                        
                        Divider()
                            .overlay(.gray)
                        
                        Text(destination.description)
                            .font(.body)

                        ScrollView(.horizontal){
                            HStack{
                                ForEach(destination.galleryImages, id: \.self) { image in
                                    Image(image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }
                          
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(destination.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if let existingFav = favDestinationIDs.first(where: { $0.id == destination.id }) {
                        //remove from fav list
                        modelContext.delete(existingFav)
                    }
                    else {
                        let favDes = FavouriteDestination(id: destination.id)
                        modelContext.insert(favDes)
                    }
                    
                } label: {
                    Image(systemName: isFav ?  "heart.fill" : "heart")
                        .foregroundStyle(.brandPrimary)
                }
            }
        }
    
    }
}

#Preview {
    NavigationStack{
        DetailView(
            destination: destinationData[0]
        )
        .modelContainer(for: FavouriteDestination.self, inMemory: true)
    }
   
}
