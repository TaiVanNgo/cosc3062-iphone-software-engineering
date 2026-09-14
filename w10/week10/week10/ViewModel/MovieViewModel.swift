//
//  ViewModel.swift
//  week10
//
//  Created by Van Tai on 3/9/26.
//

import Foundation
import Combine

import FirebaseFirestore

@Observable
class MovieViewModel {
    var movies: [Movie] = []
    private var db = Firestore.firestore()
    
    private let user: User
    
    init(user: User){
        self.user = user
        
        getAllMovieData()
    }
    
    func getAllMovieData(){
        db.collection("users")
            .document(user.userID)
            .collection("movies")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Can't find document")
                    return
                }
                
                self.movies = documents.map({ query -> Movie in
                    let data = query.data()
                    let name = data["name"] as? String ?? ""
                    
                    return Movie(name: name, documentID: query.documentID)
                })
                
                print("Fetch success", self.movies)
            }
    }
    
    func addNewMovie(name: String){
        db.collection("users")
            .document(user.userID)
            .collection("movies")
            .addDocument(data: ["name": name])
    }
    
    func removeMovie(documentID: String){
        db.collection("users")
            .document(user.userID)
            .collection("movies")
            .document(documentID).delete { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("Remove Successfully!")
        }
        
    }
}
