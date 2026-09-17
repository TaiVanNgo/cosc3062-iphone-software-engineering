//
//  ReelView.swift
//  RmitCasino
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI

struct ReelView: View {
    let reelIcon: String
    let animationIcon: Bool
    
    var body: some View {
        Image("reel")
            .resizable()
            .reelModifier()
            .overlay{
                Image(reelIcon)
                    .resizable()
                    .iconModifier()
                    .opacity(animationIcon ? 1 : 0)
                    .offset(y: animationIcon ? 0 : -50)
            }
    }
}

#Preview {
    ReelView(
        reelIcon: "apple",
        animationIcon: true
    )
}
