//
//  q3.swift
//  W2
//
//  Created by Van Tai on 7/7/26.
//
func Q3(){
    let splitTheLoot = { (loot: Int, squadSize: Int) -> Int? in
        if(loot % squadSize == 0){
            return loot/squadSize
        } else{
            return nil
        }
    }
    
    print("Enter the total loot:")
    let lootInput = readLine()
        
    print("Enter the squad size:")
    let squadSizeInput = readLine()
    
    // ensure the input not nil
    if let lootStr = lootInput, let squadSizeStr = squadSizeInput{
        // ensure the inputs are number
        if let loot = Int(lootStr), let size = Int(squadSizeStr){
            if let share = splitTheLoot(loot, size){
                print("W, everybody gets \(share) items")
            } else {
                print("L, we can't split this fairly.")
            }
        } else {
            print("Invalid Input, please enter a number")
        }
    }
    
    
}
