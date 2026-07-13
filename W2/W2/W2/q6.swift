//
//  q6.swift
//  W2
//
//  Created by Van Tai on 9/7/26.
//

func Q6(){
    let alphabet =
    ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v",
     "w","x","y","z"]
    
    // 1st way
    let randomNums: [Int] = (0...5).map{ _ in
        return Int.random(in: 0...25)
    }
    
    let gamertag: String = randomNums.map{
        alphabet[$0]
    }.joined()
    
    print(gamertag)
    
    // 2nd way
    var gamertag2 = ""
    for _ in 0...5 {
        let randomChar = alphabet.randomElement()!
        gamertag2 += randomChar
    }
    
    print(gamertag2)
}
