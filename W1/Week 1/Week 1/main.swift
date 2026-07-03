var houseMoney = 1000
var playerMoney = 100

var continuePlay = true
var round = 0

print("Try your luck to win all money of the house!")

while(continuePlay)
{
    var bet = 0
    var playerOption = ""
    
    round += 1
    print("Round \(round):")
    
    print("How much do you want to bet?")
    
    while let inputStr = readLine(){
        if let input = Int(inputStr){
            if(input <= playerMoney && input > 0){
                bet = input
                print("You have bet $\(bet)!")
                
                break
            } else if(input > playerMoney){
                print("You do not have enough money!")
            }
        }
        
        print("Please enter valid input!")
        print("How much do you want to bet?")
    }
    
    print("Do you want to bet big or small?(big/small)")
    
    while let inputString = readLine(){
        if(inputString == "big" || inputString == "small"){
            playerOption = inputString
            
            break;
        }
        
        print("Please enter valid input!")
        print("Do you want to bet big or small?(big/small)")
    }
    
//    let dice1 = Int.random(in: 1...6)
//    let dice2 = Int.random(in: 1...6)
//    let dice3 = Int.random(in: 1...6)
//    let sum = dice1 + dice2 + dice3
    
    let dices = numbers.map{
        () -> Int in return Int.random(1...6)
    }
    
//    let doubledFull = numbers.map { (number: Int) -> Int in
//        return number * 2
//    }
//    
    print("The dices are: \(dice1) \(dice2) \(dice3)")
    print("The sum of 3 dices is \(sum)!")
    
    if(dice1 == dice2 && dice2 == dice3){
        print("You Lost \(bet)$!")
        houseMoney += bet
        playerMoney -= bet
    } else if(playerOption == "small" && (4...10).contains(sum) ||
              playerOption == "big" && (11...17).contains(sum)
    ){
        print("You Won \(bet)$!")
        houseMoney -= bet
        playerMoney += bet
    } else{
        print("You Lost \(bet)$!")
        houseMoney += bet
        playerMoney -= bet
    }
    
    print("The house has $\(houseMoney)")
    print("The player has $\(playerMoney >= 0 ? playerMoney : 0)")
    
    if(playerMoney <= 0){
        print("You are out of money! Bye!")
        continuePlay = false
        break;
    }
    
    print("Do you still want to continue to play?(true/false)")
    while let inputStr = readLine(){
       if(inputStr == "true"){
           break;
       } else if(inputStr == "false"){
           continuePlay = false
           break;
       }

       print("Please enter the valid value!")
       print("Do you still want to continue to play?(true/false)")
    }
    
    
}



























//var houseMoney = 1000
//var playerMoney = 100
//var round = 0
//
//print("The house has $\(houseMoney)")
//print("The player has $\(playerMoney)")
//
//print("Try your luck to win all money of the house!")
//
//var continuePlay: Bool = true
//while(continuePlay){
//    round+=1
//    print("Round \(round):")
//    print("How much do you want to bet?")
//    var bet = 0
//    var playerOption = ""
//    
//    while let inputStr = readLine(){
//        if let input = Int(inputStr){
//            if(input <= playerMoney)
//            {
//                bet = input
//                print("You have bet $\(bet)!")
//                break;
//            } else{
//                print("You do not have enough money!")
//            }
//        }
//        print("Please enter valid input!")
//        print("How much do you want to bet?")
//    }
//    
//    print("Do you want to bet big or small?(big/small)")
//    
//    while let inputStr = readLine(){
//        if(inputStr == "big" || inputStr == "small"){
//            playerOption = inputStr
//            break;
//        }
//        
//        print("Please enter valid input!")
//        print("Do you want to bet big or small?(big/small)")
//    }
//    
//    let dice1 = Int.random(in: 1...6)
//    let dice2 = Int.random(in: 1...6)
//    let dice3 = Int.random(in: 1...6)
//    
//    print("The dices are: \(dice1) \(dice2) \(dice3)")
//    let sum = dice1 + dice2 + dice3
//    print("The sum of three dices is: \(sum)!")
//    
//    // special case, house auto win if the three dices have the same value
//    if(dice1 == dice2 && dice2 == dice3){
//        print("You Lost $\(bet)!")
//        houseMoney += bet
//        playerMoney -= bet
//    } else if(playerOption == "small" && (4...10).contains(sum)){
//        // if player choose small and sum is within the range of 4 to 10
//        print("You won $\(bet)!")
//        houseMoney -= bet
//        playerMoney += bet
//    } else if(playerOption == "big" && (11...17).contains(sum)){
//        // if player choose big and sum is within the range of 11 to 17
//        print("You won $\(bet)!")
//        houseMoney -= bet
//        playerMoney += bet
//    } else{
//        print("You Lost $\(bet)!")
//        houseMoney += bet
//        playerMoney -= bet
//    }
//    
//    if(playerMoney < 0){
//        playerMoney = 0
//    }
//    print("The house has $\(houseMoney)")
//    print("The player has $\(playerMoney)")
//    
//    if(playerMoney <= 0){
//        print("You are out of money! Bye!")
//        continuePlay = false
//        break
//    }
//    
//    print("Do you still want to continue to play?(true/false)")
//    while let inputStr = readLine(){
//        if(inputStr == "true"){
//            break;
//        } else if(inputStr == "false"){
//            continuePlay = false
//            break;
//        }
//                
//        print("Please enter the valid value!")
//        print("Do you still want to continue to play?(true/false)")
//    }
//}
