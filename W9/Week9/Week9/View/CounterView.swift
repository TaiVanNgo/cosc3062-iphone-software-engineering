//
//  CounterView.swift
//  Week9
//
//  Created by Van Tai on 24/8/26.
//

import SwiftUI

struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            Text("Count: \(viewModel.counter.value)")
                .font(.largeTitle)
                .animation(.default, value: viewModel.counter.value)
            
            HStack (spacing: 10) {
                Button("Increase"){
                    viewModel.increment()
                }
                
                Button("Decrease"){
                    viewModel.decrement()
                }
                
                Button("Reset"){
                    viewModel.reset()
                }
            }
            
        }
        .padding()
    }
    
}

#Preview {
    CounterView()
}
