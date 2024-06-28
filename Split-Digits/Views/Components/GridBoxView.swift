//
//  GridBoxView.swift
//  Split-Digits
//
//  Created by MacBookPro on 21/03/1946 Saka.
//

import SwiftUI

struct GridBoxView: View {
    @Binding var box: Grids
    
    var body: some View {
        ZStack {
            if box.isMatched {
                Color.green.opacity(0.1)
                Text("\(box.value)")
                    .foregroundColor(.black)
                    .font(.title2)
            } else if box.isRevealed {
                Color.green
                Text("\(box.value)")
                    .foregroundColor(.black)
                    .font(.title2)
            } else {
                Color.orange
            }
        }
        .frame(width: 50, height: 50)
        .cornerRadius(20)
        .animation(.default)
    }
}

