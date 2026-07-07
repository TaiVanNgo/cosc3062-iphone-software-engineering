func Q1(){
    var vibeCheck = { (day: Int) -> String in
        switch(day){
        case 1:
            return "Monday: Brain rot / No rizz"
        case 2:
            return "Tuesday: NPC grindset / Trying to cook"
        case 3:
            return "Wednesday: We are so back / Skibidi energy"
        case 4:
            return "Thursday: Delulu is the only solulu"
        case 5:
            return "Friday: Main character energy"
        case 6:
            return "Saturday: Absolute cinema / W rizz / No cap"
        case 7:
            return "Sunday: Sunday scaries / Sleeping on the grind"
        default:
            return "Invalid day"
        }        
    }

    print("Enter a day of a week (1-7):")
    
    if let dayString = readLine(){
        if let dayInt = Int(dayString){
            print("The vibe is \(vibeCheck(dayInt))")
        } else{
            print("Error: the correct format of day must be 1-7!")
        }
    }
}
