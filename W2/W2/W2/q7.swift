//
//  q7.swift
//  W2
//
//  Created by Van Tai on 10/7/26.
//

func Q7(){
    func calculateBuff(a: Int, b: Int, operation: (Int, Int) -> Int){
        print(operation(a,b))
    }
    
    calculateBuff(a: 10, b: 15, operation: {
        return max($0, $1)
    })
    
    calculateBuff(a: 10, b: 5, operation: {
        return $0 * $1
    })
    
    // Trailing form
    print("\nTRAILING FORM")
    
    calculateBuff(a: 10, b: 5){
        return max($0, $1)
    }
    
    calculateBuff(a: 10, b: 5){
        return $0 * $1
    }
}
