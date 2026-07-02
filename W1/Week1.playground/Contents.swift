var houseMoney = 1000
var playerMoney = 100
var round = 0

print("The house has $\(houseMoney)")
print("The player has $\(playerMoney)")

print("Try your luck to win all money of the house!")

while(true){
    round+=1
    print("Round \(round):")
    print("How much do you want to bet?")
    
    if let inputStr = readLine(){
        if let  input = Int(inputStr){
            break;
        } else{
            print("Please enter valid input!")
        }
    }
}
