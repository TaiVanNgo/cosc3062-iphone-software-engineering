//
//  CounterViewModel.swift
//  Week9
//
//  Created by Van Tai on 24/8/26.
//

import Combine
import Foundation

class CounterViewModel: ObservableObject {
    @Published var counter = Counter(value: 0)
    
    func increment() {
        counter.value += 1
    }
    
    func decrement() {
        counter.value -= 1
    }
    
    func reset() {
        counter.value = 0
    }
}
