//
//  MoviewView.swift
//  week10
//
//  Created by Van Tai on 3/9/26.
//

import SwiftUI

struct MovieView: View {
    @State private var movieName = ""
    @State private var movieViewModel:MovieViewModel
    
    let user: User
    
    init(user: User){
        self.user = user
        self.movieViewModel = MovieViewModel(user: user)
    }
    
    var body: some View {
        VStack{
            TextField("Enter a movie name...", text: $movieName)
                .padding()
                .border(.black)
                .frame(width: 230, height: 40, alignment: .leading)
                .padding()
            
            Button("Add Movies") {
                self.movieViewModel.addNewMovie(name: movieName)
            }
            .buttonStyle(.borderedProminent)
            .disabled(movieName.isEmpty)
        }
        
        NavigationStack{
            List{
                ForEach(movieViewModel.movies) { movie in
                    Text(movie.name ?? "")
                }
                .onDelete(perform: removeMovie)
            }
            .navigationTitle("Movie List")
            
        }
        
    }
    
    func removeMovie(at offset: IndexSet){
        for index in offset {
            if let documentID = movieViewModel.movies[index].documentID {
                movieViewModel.removeMovie(documentID: documentID)
            }
        }
    }
}

#Preview {
    let user = User(userID: "123123123")
    MovieView(user: user)
}
