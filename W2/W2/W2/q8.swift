//
//  q8.swift
//  W2
//
//  Created by Van Tai on 10/7/26.
//
import Foundation

func Q8(){
    struct LotteryTicket {
        var numbers: [Int] = []
        let price: Int = 4
        
        init(){
            self.numbers = generateRandomNumbers()
        }
        
        init(numbers: [Int]){
            self.numbers = numbers
        }
        
        func getNumbers(){
            for i in 0..<numbers.count{
                print(numbers[i], terminator: " ")
            }
        }
        
        func generateRandomNumbers() -> [Int]{
            // generate 6 random numbers
            let randomNumber:[Int] = (0...5).map{ _ in
                return Int.random(in: 1...49)
            }
            
            return randomNumber
        }
    }
    
    class LotteryGame{
        // var tickets: [LotteryTicket] = []
        // winning ticket will be generated randomly
        var winningTicket: LotteryTicket = LotteryTicket()
        
        // User choose their ticket
//        init(ticket: LotteryTicket){
//            self.tickets = Array(arrayLiteral: ticket)
//        }
//        func getTickets(){
//            if tickets.count == 1{
//                tickets[0].getNumbers()
//            } else {
//                return
//            }
//        }
        
        func getWinnningTicket(){
            winningTicket.getNumbers()
        }
        
        // return number of matched numbers and the total prize
        func checkPrizes(tickets: LotteryTicket) -> (Int, Int) {
            let setA = Set(tickets.numbers)
            let setB = Set(winningTicket.numbers)
            // calculate the numbers of matched numbers
            let matchedNumberCnt = setA.intersection(setB).count
            var prize = 0
            
            // calculate winning prizes
            switch matchedNumberCnt {
            case 1:
                prize = 10
            case 2:
                prize = 10
            case 3:
                prize = 100
            case 4:
                prize = 1000
            case 5:
                prize = 5000
            case 6:
                prize = 5000000
            default:
                prize = 0
            }
            
            return (matchedNumberCnt, prize)
        }
    }
    // MAIN PROGRAM
    print("How many games do you want to play?")
    
    guard let gamesStr = readLine() else {
        print("Please enter valid input")
        return
    }
    
    guard let games = Int(gamesStr), games > 0 else {
        print("Please enter valid input")
        return
    }
    
    if(games == 1){
        print("Do you want to pick your own ticket numbers (true/false)?")
        
        guard let manual = readLine(), manual == "true" || manual == "false" else {
            print("Please enter valid input")
            return
        }
        
        var userNumbers: [Int] = []
        if(manual == "true"){
            guard let numberStr = readLine() else {
                print("Please enter valid input")
                return
            }
            
            let numberArr = numberStr.components(separatedBy: " ")
            
            guard numberArr.count == 6 else {
                print("Please enter valid input")
                return
            }
            
            userNumbers = numberArr.map{
                Int($0)!
            }
        }
        
        var userTicket: LotteryTicket
        if(userNumbers.count > 0){
            userTicket = LotteryTicket(numbers: userNumbers)
        } else{
            userTicket = LotteryTicket()
        }
        
        let lotteryGame = LotteryGame()
        print("You have picked the ticket: ", terminator: "")
        userTicket.getNumbers()
        
        print("\nThe winning ticket is: ", terminator: "")
        lotteryGame.getWinnningTicket()
        
        let result: (Int, Int) = lotteryGame.checkPrizes(tickets: userTicket)
        print("\nYour ticket has matched \(result.0) number(s)")
        print("You have won $\(result.1)")
        
        return
    }
    
    
    
    
    
    
    
}

