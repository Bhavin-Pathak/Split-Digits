//
//  GridBoxView.swift
//  Split-Digits
//
//  Created by Bhavin Pathak on 28/06/2024
//

import SwiftUI

struct GridBoxLayout: View {
    @Binding var box: GameModels
    
    var body: some View {
        ZStack {
            if box.isMatched {
                Color.orange.opacity(0.5)
                Text("\(box.value)")
                    .foregroundColor(.black)
                    .font(.title2)
            } else if box.isRevealed {
                Color.orange
                Text("\(box.value)")
                    .foregroundColor(.black)
                    .font(.title2)
            } else {
                Color.indigo
            }
        }
        .frame(width: 50, height: 50)
        .cornerRadius(20)
        .animation(.default)
    }
}

