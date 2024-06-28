//
//  ContentView.swift
//  Split-Digits
//
//  Created by MacBookPro on 21/03/1946 Saka.
//

import SwiftUI

struct GameScreen: View {
    @ObservedObject var viewModel = GridsViewModel()
    
    var body: some View {
        VStack {
            GridView(boxes: $viewModel.boxes, onSelect: viewModel.selectBox)
        }
        .alert(isPresented: Binding(
            get: { viewModel.boxes.allSatisfy { $0.isMatched } },
            set: { _ in viewModel.resetGame() }
        )) {
            Alert(title: Text("You are win!"), message: Text("Congratulations from all of us!"), dismissButton: .default(Text("OHK")))
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}

