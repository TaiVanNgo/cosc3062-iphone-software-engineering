//
//  q5.swift
//  W2
//
//  Created by Van Tai on 9/7/26.
//
import Foundation

func Q5(){
    class Point{
        private var x: Double
        private var y: Double
        
        init(x: Double, y: Double) {
            self.x = x
            self.y = y
        }
        
        func distance(target: Point) -> Double {
            return sqrt(
                    pow(self.x - target.x, 2) +
                    pow(self.y - target.y, 2)
            )
       }
    }
    
    print("Enter the first x and y:")
    let p1Input = readLine()
    print("Enter the second x and y:")
    let p2Input = readLine()
    
    // safely dewrap
    guard let p1Input,
          let p2Input else {
        print("Please enter valid input!")
        return
    }
    
    // split input
    let p1Arr = p1Input.components(separatedBy: " ")
    let p2Arr = p2Input.components(separatedBy: " ")
    
    guard p1Arr.count >= 2, p2Arr.count >= 2,
          let p1X = Double(p1Arr[0]), let p1Y = Double(p1Arr[1]),
          let p2X = Double(p2Arr[0]), let p2Y = Double(p2Arr[1])
    else{
        print("Please enter valid input!")
        return
    }
    
    let p1 = Point(x: p1X, y: p1Y)
    let p2 = Point(x: p2X, y: p2Y)
    
    print("The distance between X and Y is \(p1.distance(target: p2))")
}
