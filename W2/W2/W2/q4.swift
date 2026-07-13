//
//  q4.swift
//  W2
//
//  Created by Van Tai on 9/7/26.
//

func Q4() {
    struct StreamerProfile{
        var username: String
        var discordTag: String?
        var followers: Int
        var isLive: Bool
        
        func logStatus() {
            if(self.isLive){
                print("\(self.username) is streaming to millions!")
            } else{
                print("\(self.username) is touching grass.")
            }
        }
    }
    
    let streamer = StreamerProfile(username: "Thay Giao Ba", discordTag: nil, followers: 0, isLive: false)
    streamer.logStatus()
    
    print("\nDiagnostic code to test your StreamerProfile struct:")
    var speed = StreamerProfile(username: "IShowSpeed", discordTag: "ishowspeed#1234", followers: 20000000, isLive: true)
    speed.logStatus()
    print("Contacting \(speed.username) on \(speed.discordTag!) ...")
    print("\(speed.username) has \(speed.followers) followers")
    
    // sometime later
    speed.isLive = false
    speed.logStatus()
}

