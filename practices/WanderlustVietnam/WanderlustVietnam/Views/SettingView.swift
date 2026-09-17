//
//  Settings.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI

struct Settings: View {
    @AppStorage("theme") var isDarkTheme = false
    
    var body: some View {
        Form{
            Section("APPERANCE"){
                HStack{
                    Text("Dark Mode")
                                        
                    Toggle("Label", isOn: $isDarkTheme)
                }
            }
        }
    }
}

#Preview {
    Settings()
}

