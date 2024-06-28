//
//  GridView.swift
//  Split-Digits
//
//  Created by MacBookPro on 21/03/1946 Saka.
//

import SwiftUI

struct GridLayout: View {
    
    @Binding var boxes: [GameModels]
    let onSelect: (GameModels) -> Void
    //MARK: Column Count
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 6)
    
    var body: some View {
        //MARK: Grid Layout
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach($boxes.indices, id: \.self) { index in
                GridBoxLayout(box: $boxes[index])
                    .onTapGesture {
                        onSelect(boxes[index])
                    }
            }
        }
        .padding()
    }
}

